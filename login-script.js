document.addEventListener('DOMContentLoaded', () => {
    const roleItems = document.querySelectorAll('.role-item');
    const userLabel = document.getElementById('user-label');
    const userInput = document.getElementById('username-field');
    const formSubtitle = document.getElementById('form-subtitle');
    const formContent = document.querySelector('.login-form-content');
    const loginForm = document.getElementById('login-form');
    const togglePassword = document.getElementById('togglePassword');
    const passwordInput = document.getElementById('password');

    const roleSettings = {
        'Student': { label: 'Registration Number', placeholder: 'e.g. EU/TR/2020/MS/01', subtitle: 'Sign in to access your courses and results' },
        'Staff': { label: 'Staff Employee ID', placeholder: 'e.g. STF/E/2045', subtitle: 'Sign in to manage clearances and requests' },
        'Registrar': { label: 'Officer ID', placeholder: 'e.g. REG/AR/TR/01', subtitle: 'Sign in to verify and approve certificates' },
        'Admin': { label: 'Administrator Username', placeholder: 'Enter admin username', subtitle: 'System administration and management portal' }
    };

    // Role switching logic
    roleItems.forEach(item => {
        item.addEventListener('click', () => {
            roleItems.forEach(i => i.classList.remove('active'));
            item.classList.add('active');
            const selectedRole = item.getAttribute('data-role');
            const config = roleSettings[selectedRole];
            formContent.style.opacity = '0';
            setTimeout(() => {
                userLabel.innerText = config.label;
                userInput.placeholder = config.placeholder;
                formSubtitle.innerText = config.subtitle;
                userInput.value = '';
                formContent.style.opacity = '1';
            }, 250);
        });
    });

    togglePassword.addEventListener('click', function() {
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        this.classList.toggle('fa-eye');
        this.classList.toggle('fa-eye-slash');
    });

// Login logic
    loginForm.addEventListener('submit', async (e) => {
        e.preventDefault();
        const activeRoleItem = document.querySelector('.role-item.active');
        const selectedRole = activeRoleItem ? activeRoleItem.getAttribute('data-role') : 'Student';
        const role = selectedRole.toLowerCase();   
        const username = userInput.value.trim();
        const password = passwordInput.value.trim();

        if (!username || !password) {
            alert("Please fill all fields!");
            return;
        }

        try {
            const response = await fetch('http://localhost:3000/api/login', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ username, password, role })
            });
            
            const result = await response.json();
            if (result.success) {
                localStorage.setItem('loggedInUser', JSON.stringify(result.user));

                const userRole = result.user.role.toLowerCase(); 
                console.log("Logged in as role:", userRole);
                
                if (userRole === 'student') {
                    window.location.href = 'student-dashboard.html'; 
                } else if (userRole === 'staff') {
                    window.location.href = 'staff-dashboard.html'; 
                } else if (userRole === 'registrar') {
                    window.location.href = 'registrar-dashboard.html';
                } else if (userRole === 'admin'){
                    window.location.href = 'admin-dashboard.html';
                } else {
                    alert("⚠️ System Error: Role not recognized");
                } 
            } else {
                alert("❌ Error: " + result.message);
            }
        } catch (error) {
            console.error(error);
            alert("⚠️ Server Error: Check backend!");
        }
    });
    
window.openModal = function(event) {
    if(event) event.preventDefault();
    const modal = document.getElementById('forgotModal');
    if (modal) {
        modal.style.display = 'flex';
    } else {
        console.error("ForgotModal div not found!");
    }
};

  
    window.closeModal = function() {
        document.getElementById('forgotModal').style.display = 'none';
        document.getElementById('step1').style.display = 'block';
        document.getElementById('step2').style.display = 'none';
    };


    window.handleSendOTP = async function() {
        const email = document.getElementById('resetEmail').value;
        const btn = document.getElementById('sendOtpBtn');

        if (!email) {
            alert("Please enter your registered email!");
            return;
        }

        btn.innerText = "Sending...";
        btn.disabled = true;

        try {
            const response = await fetch('http://localhost:3000/api/auth/forgot-password', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ email })
            });

            const data = await response.json();
            if (data.success) {
                alert("OTP sent to your email!");
                document.getElementById('step1').style.display = 'none';
                document.getElementById('step2').style.display = 'block';
            } else {
                alert(data.message);
            }
        } catch (error) {
            alert("Server error. Please check your connection.");
        } finally {
            btn.innerText = "Send OTP";
            btn.disabled = false;
        }
    };

    // 4. Step 2: Reset Password
    window.handleResetPassword = async function() {
        const email = document.getElementById('resetEmail').value;
        const otp = document.getElementById('otpCode').value;
        const newPassword = document.getElementById('newPassword').value;
        const confirmPass = document.getElementById('confirmPassword').value;

        if (newPassword !== confirmPass) {
            alert("Passwords do not match!");
            return;
        }

        try {
            const response = await fetch('http://localhost:3000/api/auth/reset-password', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ email, otp, newPassword })
            });

            const data = await response.json();
            if (data.success) {
                alert("Password reset successful! You can now login.");
                closeModal();
            } else {
                alert(data.message);
            }
        } catch (error) {
            alert("Error resetting password.");
        }
    };

   
    window.onclick = function(event) {
        const modal = document.getElementById('forgotModal');
        if (event.target == modal) {
            closeModal();
        }
    };

}); 

