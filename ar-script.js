// Logout function එක
function logoutUser() {
    
    if (confirm("Are you sure you want to logout?")) {
        localStorage.clear(); 
        window.location.href = 'home.html'; 
    }
}

let chartsLoaded = false;

function showSection(sectionId, element) {
    document.querySelectorAll('.content-section').forEach(sec => {
        sec.style.display = 'none';
        sec.classList.remove('active-section');
    });

    const formattedId = sectionId.toLowerCase().replace(/\s+/g, '-') + '-section';
    const target = document.getElementById(formattedId);

    if (target) {
        target.style.display = 'block';
        target.classList.add('active-section');

        
        if (sectionId === 'Reports' && !chartsLoaded) {
            setTimeout(initCharts, 200); 
            chartsLoaded = true; 
        }
    } else {
        console.warn("Section not found: " + formattedId);
    }
    
    document.querySelectorAll('.nav-item').forEach(item => item.classList.remove('active'));
    if (element) element.classList.add('active');
}


function filterTable() {
    const input = document.getElementById("studentSearch");
    const filter = input.value.toUpperCase();
    const table = document.getElementById("clearanceTable");
    const tr = table.getElementsByTagName("tr");

    for (let i = 1; i < tr.length; i++) {
        const tdIndex = tr[i].getElementsByTagName("td")[0];
        const tdName = tr[i].getElementsByTagName("td")[1];
        if (tdIndex || tdName) {
            const txtValueIndex = tdIndex.textContent || tdIndex.innerText;
            const txtValueName = tdName.textContent || tdName.innerText;
            tr[i].style.display = (txtValueIndex.toUpperCase().indexOf(filter) > -1 || 
                                  txtValueName.toUpperCase().indexOf(filter) > -1) ? "" : "none";
        }
    }
}

function searchTable() {
    let input = document.getElementById("arSearch").value.toUpperCase();
    let rows = document.querySelector("#requestList").rows;
    for (let row of rows) {
        let indexCol = row.cells[0].textContent.toUpperCase();
        row.style.display = indexCol.indexOf(input) > -1 ? "" : "none";
    }
}

function appendMessage(sender, text, id = null) {
    const chatWindow = document.getElementById('chatWindow'); 
    const msgDiv = document.createElement("div");
    
  
    msgDiv.className = sender === 'bot' ? 'msg bot-msg' : 'msg user-msg';
    if (id) msgDiv.id = id;

    const icon = sender === 'bot' ? '<i class="fas fa-robot"></i> ' : '';
    msgDiv.innerHTML = `${icon}<span>${text}</span>`;
    
    chatWindow.appendChild(msgDiv);
    chatWindow.scrollTop = chatWindow.scrollHeight; 
}


async function sendMessage() {
    const inputField = document.getElementById('aiQuery'); 
    const query = inputField.value.trim();

    if (query === "") return;

    
    appendMessage('user', query);
    inputField.value = ""; 

    const botMsgId = "bot-" + Date.now();
    appendMessage('bot', "Thinking...", botMsgId);

    try {
        const response = await fetch('/api/chatbot/ask', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ query: query })
        });

        const data = await response.json();
        document.getElementById(botMsgId).querySelector('span').innerText = data.reply;

    } catch (error) {
        document.getElementById(botMsgId).querySelector('span').innerText = "Connection error. Please check your server.";
    }
}

function quickAsk(queryText) {

    document.getElementById('aiQuery').value = queryText;
    sendMessage();
}

document.getElementById('aiQuery').addEventListener('keypress', function (e) {
    if (e.key === 'Enter') {
        sendMessage();
    }
});


function filterHistory() {
    const input = document.getElementById("historySearch");
    const filter = input.value.toUpperCase();
    const table = document.getElementById("historyTable");
    const tr = table.getElementsByTagName("tr");

    for (let i = 1; i < tr.length; i++) {
        const tdRef = tr[i].getElementsByTagName("td")[0];
        const tdIndex = tr[i].getElementsByTagName("td")[1];
        
        if (tdRef || tdIndex) {
            const txtRef = tdRef.textContent || tdRef.innerText;
            const txtIndex = tdIndex.textContent || tdIndex.innerText;
            tr[i].style.display = (txtRef.toUpperCase().indexOf(filter) > -1 || 
                                  txtIndex.toUpperCase().indexOf(filter) > -1) ? "" : "none";
        }
    }
}


function initCharts() {
   const chartOptions = {
        responsive: true,
        maintainAspectRatio: false, 
        plugins: {
            legend: {
                position: 'bottom', 
                labels: { boxWidth: 12, padding: 20 }
            }
        }
    };

    // Status Chart
    new Chart(document.getElementById('statusChart'), {
        type: 'doughnut',
        data: {
            labels: ['Completed', 'Pending', 'In-Review'],
            datasets: [{ 
			    data: [65, 20, 15], 
				backgroundColor: ['#10b981', '#f59e0b', '#3b82f6'] 
				}]
        },
        options: chartOptions
    });

    // Trend Chart
    new Chart(document.getElementById('trendChart').getContext('2d'), {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
            datasets: [{ label: 'Requests', data: [30, 45, 60, 40, 55], borderColor: '#2563eb', fill: true, backgroundColor: 'rgba(37, 99, 235, 0.1)' }]
        },
        options: chartOptions
    });

    // Dept Chart
    new Chart(document.getElementById('deptChart').getContext('2d'), {
        type: 'bar',
        data: {
            labels: ['IS', 'MS', 'Linguistics', 'Commerce'],
            datasets: [{ label: 'Volume', data: [42, 58, 25, 33], backgroundColor: '#6366f1' }]
        },
        options: chartOptions
    });
}

// EUSL Forward Logic
function forwardToMain(indexNo) {
    if (confirm(`Forward Index No: ${indexNo} to Main Campus?`)) {
        alert(`Success: Request ${indexNo} forwarded to Main Campus.`);
    }
}


document.addEventListener('DOMContentLoaded', () => {
    fetchNewRequests();
});

async function fetchNewRequests() {
    try {
        const response = await fetch('http://localhost:3000/api/registrar/new-requests');
        
        if (!response.ok) {
            throw new Error(`Server error: ${response.status}`);
        }

        const data = await response.json();
        const tableBody = document.getElementById("requestList");
        
        if (!tableBody) return;
        tableBody.innerHTML = ""; 

        if (data.length === 0) {
            tableBody.innerHTML = "<tr><td colspan='5' style='text-align:center;'>No new requests.</td></tr>";
            return;
        }

        data.forEach(req => {
            const row = `
                <tr>
                    <td>${req.reg_number || req.index_no}</td>
                    <td>${req.certificate_type}</td>
                    <td>${new Date(req.submitted_date).toLocaleDateString()}</td>
                    <td>
                        <div class="clearance-dots">
                            <span class="dot green" title="Library"></span>
                            <span class="dot green" title="Hostel"></span>
                            <span class="dot green" title="Dept"></span>
                        </div>
                    </td>
                    <td>
                        <button class="btn-review-main" onclick="openReviewPanel(${req.id})">Review</button>
                    </td>
                </tr>
            `;
            tableBody.innerHTML += row;
        });
    } catch (error) {
        console.error("Error fetching AR requests:", error);
    }
}
// Modal එක වහන function එක (මෙය ඕනෑම තැනක තිබිය හැක)
function closeARModal() {
    const modal = document.getElementById('arReviewModal');
    if (modal) modal.style.display = 'none';
}


async function openReviewPanel(id) {
    console.log("🔍 Fetching details for ID:", id); // ID එක එනවද බලන්න

    try {
        // Backend එකෙන් දත්ත ලබා ගැනීම (Relative Path එක පාවිච්චි කරමු)
        const response = await fetch(`/api/registrar/request-details/${id}`);
        
        console.log("🌐 Response status:", response.status); // 200 ද 404 ද කියලා බලන්න

        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`Server responded with ${response.status}: ${errorText}`);
        }

        const data = await response.json();
        console.log("📦 Received Data:", data); // දත්ත ලැබුණාම පෙන්නනවා

        const container = document.getElementById('arModalDetails');
        if (container) {
            container.innerHTML = `
                <div style="line-height: 2; font-size: 16px;">
                    <p><strong>Student Name:</strong> ${data.student_name}</p>
                    <p><strong>Reg No:</strong> ${data.reg_number}</p>
                    <p><strong>Certificate:</strong> ${data.certificate_type}</p>
                    <p><strong>Date:</strong> ${new Date(data.submitted_date).toLocaleDateString()}</p>
                </div>
            `;
            document.getElementById('arReviewModal').style.display = 'block';
        }

    } catch (error) {
        console.error("❌ Error loading details:", error);
        alert("විස්තර පෙන්වීමේ දෝෂයක්: " + error.message);
    }
}

