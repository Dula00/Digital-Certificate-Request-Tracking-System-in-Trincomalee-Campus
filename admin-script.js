// Logout function එක
function logoutUser() {
    // 1. Confirm එකක් අහනවා (Optional - ඕනේ නැත්නම් මේ line එක අයින් කරන්න)
    if (confirm("Are you sure you want to logout?")) {
        
        // 2. LocalStorage එකේ තියෙන ඔක්කොම දත්ත මකනවා
        localStorage.clear(); 
        
        // 3. යූසර්ව Home Page එකට යවනවා
        // මෙතන 'home.html' වෙනුවට ඔයාගේ මුල් පිටුවේ නම දෙන්න (index.html ද දන්නේ නැහැනේ)
        window.location.href = 'home.html'; 
    }
}


function showSection(sectionId, element) {
const pageTitle = document.querySelector('.page-title');

// 1. ඔක්කොම Sections ටික list එකකට ගන්න
    const sections = [
 document.querySelector('.stats-grid'),
        document.querySelector('.content-grid'),
        document.getElementById('approvals-section'),
        document.getElementById('user-management-section'),
        document.getElementById('analytics-section'),
        document.getElementById('settings-section')
    ];

    // 2. හැම එකක්ම Hide කරන්න
    sections.forEach(sec => {
        if (sec) sec.style.display = 'none';
    });

    // 3. Title එක update කරන්න
    if (pageTitle) {
        if (sectionId === 'request') pageTitle.innerText = 'User Management';
        else pageTitle.innerText = sectionId.charAt(0).toUpperCase() + sectionId.slice(1);
    }

    // 4. Click කරපු එක විතරක් පෙන්නන්න
    if (sectionId === 'dashboard') {
        document.querySelector('.stats-grid').style.display = 'grid';
        document.querySelector('.content-grid').style.display = 'grid';
    } else {
        const target = document.getElementById(sectionId + '-section');
        if (target) target.style.display = 'block';
        
        // Analytics නම් charts load කරන්න
        if (sectionId === 'analytics' && typeof initAnalyticsCharts === "function") {
            initAnalyticsCharts();
        }
    }

    // 5. Sidebar Active class
    document.querySelectorAll('.nav-item').forEach(item => item.classList.remove('active'));
    if (element) element.classList.add('active');
}

// --- 2. Action Functions ---

function processLevel1(indexNo) {
    if(confirm(`Level 1: Forward Index ${indexNo} to Main Campus?`)) {
        alert(`✅ Request ${indexNo} forwarded.`);
    }
}

// --- 3. Modal Logic (Full View & Digital Signature) ---

function previewCertificate(studentId) {
    const vcSig = document.getElementById('vcSignature');
    const regSig = document.getElementById('registrarSignature');
    const seal = document.getElementById('universitySeal');
    
    // Reset Visibility
    if(vcSig) vcSig.style.opacity = "0";
    if(regSig) regSig.style.opacity = "0";
    if(seal) {
        seal.style.opacity = "0";
        seal.style.transform = "scale(2)";
        seal.innerHTML = "";
    }

    // ශිෂ්‍යයාගේ නම Table එකෙන් හොයනවා
    let studentName = "Student Name Not Found";
    const allRows = document.querySelectorAll('#approvals-section tbody tr');
    allRows.forEach(row => {
        if(row.cells[0].innerText.trim() === studentId) {
            studentName = row.cells[1].innerText;
        }
    });

    const modal = document.getElementById('infoModal');
    if (modal) {
        document.getElementById('modalName').innerText = studentName;
        document.getElementById('certStudentName').innerText = studentName;
        document.getElementById('modalIndexDisplay').innerText = "Index No: " + studentId;
        
        modal.style.display = "block";
        
        const modalApproveBtn = document.getElementById('modalApproveBtn');
        if(modalApproveBtn) {
            modalApproveBtn.onclick = function() {
                finalApproveAndSign(studentId);
            };
        }
    }
}

function finalApproveAndSign(studentId) {
    const modal = document.getElementById('infoModal');
    if(modal && modal.style.display !== "block") {
        previewCertificate(studentId);
    }

    setTimeout(() => {
        if(confirm(`Apply Eastern University Digital Signature for ${studentId}?`)) {
            
            const vcSig = document.getElementById('vcSignature');
            const regSig = document.getElementById('registrarSignature');
            const seal = document.getElementById('universitySeal');

            if(vcSig && regSig && seal) {
                // VC Signature එක Text එකක් විදිහට
                 vcSig.style.backgroundImage = "none"; // පරණ ලින්ක් එක අයින් කරනවා
                 vcSig.innerHTML = "<span style='font-family: \"Cursive\", cursive; font-size: 24px; color: #000;'>Prof. J. Perera</span>";
    
    // Registrar Signature එක Text එකක් විදිහට
                regSig.style.backgroundImage = "none";
                regSig.innerHTML = "<span style='font-family: \"Cursive\", cursive; font-size: 22px; color: #000;'>Dr. K. Silva</span>";
                vcSig.style.opacity = "1";
                regSig.style.opacity = "1";

           // --- QR Code කොටස මේ විදිහට update කරන්න ---
const qrContainer = document.getElementById('universityQR');
if(qrContainer) {
    // 1. කලින් තිබුණු styles clear කරනවා
    qrContainer.innerHTML = ""; 
    
    // 2. ඉතාම සරල Verification Link එකක් හදනවා
    let verifyUrl = `http://localhost:3000/verify.html?id=${studentId}`;
    
    // 3. Google Chart API Link එක (මේකේ encodeURIComponent අනිවාර්යයි)
    let qrImageUrl = "https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=" + encodeURIComponent(verifyUrl);
    
    // 4. Image එක background එකට දානවා වෙනුවට <img> tag එකක් විදිහට ඇතුළටම දාමු (එතකොට අනිවාර්යයෙන්ම පේනවා)
    qrContainer.innerHTML = `<img src="${qrImageUrl}" style="width: 100%; height: 100%; object-fit: contain;">`;
    
    // 5. පෙනුම සකස් කරනවා
    qrContainer.style.opacity = "1";
    qrContainer.style.border = "none"; // අර කළු කොටුව අයින් කරන්න
}
                
                // Seal Animation
                seal.style.opacity = "0.7";
                seal.style.transform = "scale(1) rotate(-15deg)";
                seal.style.backgroundColor = "rgba(180, 0, 0, 0.1)";
                seal.innerHTML = "<span style='color: #900; font-weight: bold; font-size: 11px; text-align: center; display: block;'>EUSL<br>OFFICIAL</span>";

                setTimeout(() => {
                    alert(`🎓 Success! Degree Certificate for ${studentId} Signed & Issued.`);
                    closeModal();
                    
                    const allRows = document.querySelectorAll('#approvals-section tbody tr');
                    allRows.forEach(row => {
                        if(row.cells[0].innerText.trim() === studentId) {
                            row.style.transition = "0.8s";
                            row.style.backgroundColor = "#dcfce7";
                            row.style.opacity = "0";
                            setTimeout(() => row.remove(), 800);
                        }
                    });
                }, 2000);
            }
        }
    }, 500);
}

function closeModal() {
    const modal = document.getElementById('infoModal');
    if(modal) modal.style.display = "none";
}

window.onclick = function(event) {
    const modal = document.getElementById('infoModal');
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

// --- 4. Chart Logic ---
document.addEventListener('DOMContentLoaded', () => {
    const chartElement = document.getElementById('facultyChart');
    if (chartElement) {
        const ctx = chartElement.getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['computer Science', 'Management', 'communication', 'Applied Science',  'Medicine'],
                datasets: [{
                    label: 'Approved Clearances',
                    data: [120, 190, 80, 150, 200],
                    backgroundColor: '#3b82f6',
                    borderRadius: 5
                }]
            },
            options: { responsive: true, maintainAspectRatio: false }
        });
    }
});

function initAnalyticsCharts() {
    // Monthly Bar Chart
    const ctxMonthly = document.getElementById('monthlyChart').getContext('2d');
    new Chart(ctxMonthly, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
                label: 'Certificates Issued',
                data: [45, 52, 38, 65, 48, 70],
                borderColor: '#0284c7',
                fill: true,
                backgroundColor: 'rgba(2, 132, 199, 0.1)'
            }]
        }
    });

    // Department Pie Chart
    const ctxPie = document.getElementById('deptPieChart').getContext('2d');
    new Chart(ctxPie, {
        type: 'doughnut',
        data: {
            labels: ['HR', 'IM', 'Accounting', 'Management'],
            datasets: [{
                data: [300, 150, 100, 200],
                backgroundColor: ['#3b82f6', '#10b981', '#f59e0b', '#6366f1']
            }]
        }
    });
}