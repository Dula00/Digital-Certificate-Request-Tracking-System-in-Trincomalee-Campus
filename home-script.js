document.addEventListener('DOMContentLoaded', () => {
    // 1. Navbar Scroll Effect
    const navbar = document.querySelector('nav');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.style.padding = '15px 8%';
            navbar.style.boxShadow = '0 4px 20px rgba(0,0,0,0.1)';
        } else {
            navbar.style.padding = '20px 8%';
            navbar.style.boxShadow = '0 2px 10px rgba(0,0,0,0.05)';
        }
    });

    // 2. Smooth Scroll for links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // 3. Simple Alert for 'Help' (Optional)
    const helpLink = document.querySelector('a[href="#help"]');
    if(helpLink) {
        helpLink.addEventListener('click', () => {
            alert("Contact the University IT Support for assistance.");
        });
    }
});
    // Chat window එක open/close කිරීම
function toggleChatWindow() {
    const chatWindow = document.getElementById('chatbot-window');
    if (chatWindow.style.display === 'none' || chatWindow.style.display === '') {
        chatWindow.style.display = 'flex';
        
        // Chatbot එක open වුණාම message එකක් type කරන්න ලේසි වෙන්න input එකට focus කරන්න
        document.getElementById('chat-input').focus();
    } else {
        chatWindow.style.display = 'none';
    }
}

// User පණිවිඩයක් Send කිරීම
function sendMessage() {
    const input = document.getElementById('chat-input');
    const messageText = input.value.trim();
    if (!messageText) return;

    appendMessage(messageText, 'user-message');
    input.value = '';

    // Bot ගේ Reply එක තත්පරයකට පස්සේ එන්න දෙනවා (ලස්සනට පේන්න)
    setTimeout(() => {
        const botReply = getBotReply(messageText);
        appendMessage(botReply, 'bot-message');
    }, 1000);
}

// Quick Reply Buttons ක්ලික් කිරීම
function handleQuickClick(question) {
    appendMessage(question, 'user-message');
    setTimeout(() => {
        const botReply = getBotReply(question);
        appendMessage(botReply, 'bot-message');
    }, 1000);
}

// Message එක Screen එකට එකතු කිරීම
function appendMessage(text, className) {
    const chatBody = document.getElementById('chat-body');
    const messageDiv = document.createElement('div');
    messageDiv.className = `message ${className}`;
    messageDiv.innerText = text;
    chatBody.appendChild(messageDiv);
    chatBody.scrollTop = chatBody.scrollHeight; // අන්තිමට ආපු message එකට scroll කිරීම
}

// Keyword අනුව Bot ගේ උත්තරය තේරීම
function getBotReply(userInput) {
    const input = userInput.toLowerCase();

    // 🎯 1. මුලින්ම Tracking ගැන චෙක් කරනවා
    if (input.includes('track') || input.includes('status')) {
        return "You can track your application by using your Request ID (e.g., #REQ-12) in the 'Track Certificate Status' section.";
    }

    else if (input.includes('request') || input.includes('how to')) {
        return "To request a certificate, please log in to the Student Dashboard and go to the 'Request Certificate' tab.";
    
    } else if (input.includes('forgot') || input.includes('password')) {
        return "If you forgot your password, please click on 'Forgot Password' on the Login page or contact the IT support.";
    } else if (input.includes('hi') || input.includes('hello')) {
        return "Hello! How can I assist you today?";
    } else {
        return "I'm sorry, I didn't quite understand that. You can try clicking one of the quick options above!";
    }
}
//faq section එකේ question එක click කිරීමෙන් answer එක show/hide කිරීම
function toggleFAQ(element) {
    const faqItem = element.parentElement;
    
    // දැනට open වෙලා තියෙන අනිත් ඒවා close කිරීමට (Optional)
    document.querySelectorAll('.faq-item').forEach(item => {
        if (item !== faqItem) {
            item.classList.remove('active');
        }
    });

    // ක්ලික් කළ එක toggle කිරීම
    faqItem.classList.toggle('active');
}
