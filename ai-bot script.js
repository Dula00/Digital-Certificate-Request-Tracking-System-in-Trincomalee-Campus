// 1. AI Window එක විවෘත කිරීම සහ වැසීම
function toggleSmartAI() {
    const container = document.getElementById('eusl-ai-container');
    if (container) {
        container.classList.toggle('ai-closed');
    }
}

// 3. මැසේජ් එකක් යැවීමේ ප්‍රධාන Function එක
async function processAIQuery() {
    const inputField = document.getElementById('ai-queries');
    const query = inputField.value.trim();

    if (query === "") return;

    // යූසර්ගේ මැසේජ් එක පෙන්වීම
    appendMessage('user', query);
    inputField.value = ""; // Input එක හිස් කිරීම

    // බොට් "Thinking..." පණිවිඩය පෙන්වීම
    const botMsgId = "bot-" + Date.now();
    appendMessage('bot', "Analyzing data...", botMsgId);

    try {
        // 🚀 Backend API එකට Request එක යැවීම
        const response = await fetch('/api/chatbot/ask', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ query: query })
        });

        if (!response.ok) throw new Error("Server error");

        const data = await response.json();
        
        // සර්වර් එකෙන් ආපු reply එක "Thinking..." වෙනුවට update කිරීම
        const botElement = document.getElementById(botMsgId);
        if (botElement) {
            botElement.innerText = data.reply;
        }

    } catch (error) {
        console.error("AI Error:", error);
        const botElement = document.getElementById(botMsgId);
        if (botElement) {
            botElement.innerText = "I'm having trouble connecting to the database. Please try again later.";
        }
    }
}

// 4. මැසේජ් එක Chat Window එකට එකතු කරන පොදු Function එක
function appendMessage(sender, text, id = null) {
    const chatFlow = document.getElementById('ai-chat-flow');
    const msgDiv = document.createElement("div");
    msgDiv.className = `ai-msg ${sender}`;
    if (id) msgDiv.id = id;
    msgDiv.innerText = text;
    
    chatFlow.appendChild(msgDiv);
    
    // හැමවිටම අලුත්ම මැසේජ් එක පේන විදිහට පල්ලෙහාට Scroll කිරීම
    chatFlow.scrollTop = chatFlow.scrollHeight;
}

// 5. Keyboard එකේ Enter එබූ විට මැසේජ් එක යන ලෙස සකස් කිරීම
document.getElementById('ai-queries').addEventListener('keypress', function (e) {
    if (e.key === 'Enter') {
        processAIQuery();
    }
});