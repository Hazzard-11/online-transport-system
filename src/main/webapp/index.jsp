<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Registration Form</title>
    <style>
    :root {
      --primary-color: #0077b6;
      --primary-dark: #023e8a;
      --secondary-color: #0096c7;
      --error-color: #e63946;
      --success-color: #2a9d8f;
      --text-light: #f8f9fa;
      --text-dark: #212529;
      --glass-bg: rgba(255, 255, 255, 0.15);
      --glass-border: rgba(255, 255, 255, 0.2);
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: flex-start;
      min-height: 100vh;
      position: relative;
      overflow-x: hidden;
      color: var(--text-light);
    }

    /* Background image with blur */
    body::before {
      content: "";
      position: fixed;
      top: 0;
      left: 0;
      height: 100vh;
      width: 100vw;
	  background-image: url('./asset/transport.jpg');
      filter: blur(8px);
      z-index: -2;
    }

    /* Glassmorphism form container */
    .form-container {
      background: var(--glass-bg);
      backdrop-filter: blur(12px);
      -webkit-backdrop-filter: blur(12px);
      border-radius: 16px;
      border: 1px solid var(--glass-border);
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
      padding: 1rem;
      margin: 1rem 1rem;
      width: 100%;
      max-width: 700px;
      z-index: 1;
      transition: all 0.3s ease;
    }

    h2 {
      text-align: center;
      margin-bottom: 1rem;
      font-size: 2rem;
      color: white;
      text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    h3 {
      margin: 1.5rem 0 1rem;
      padding-left: 0.75rem;
      font-size: 1.25rem;
      border-left: 4px solid var(--primary-color);
    }

    /* Progress indicator */
    .progress-container {
      display: flex;
      justify-content: center;
      margin-bottom: 1rem;
      gap: 0.5rem;
    }

    .progress-step {
      width: 2rem;
      height: 2rem;
      border-radius: 50%;
      background-color: rgba(255, 255, 255, 0.3);
      border: 2px solid rgba(255, 255, 255, 0.5);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 0.8rem;
      font-weight: bold;
      position: relative;
      transition: all 0.3s ease;
    }

    .progress-step.active {
      background-color: var(--primary-color);
      border-color: var(--primary-color);
      color: white;
    }

    .progress-step.completed {
      background-color: var(--success-color);
      border-color: var(--success-color);
      color: white;
    }

    /* Form styling */
    .form-page {
      display: none;
      animation: fadeIn 0.5s ease;
    }

    .form-page.active {
      display: block;
    }

    .form-group {
      margin-bottom: 1.25rem;
    }

    label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: 600;
    }

    .input-wrapper {
      position: relative;
    }

    input, select {
      width: 100%;
      padding: 0.75rem 1rem;
      border: 1px solid rgba(255, 255, 255, 0.3);
      border-radius: 8px;
      font-size: 1rem;
      background-color: rgba(255, 255, 255, 0.85);
      transition: all 0.3s ease;
    }

    input:focus, select:focus {
      outline: none;
      border-color: var(--primary-color);
      box-shadow: 0 0 0 2px rgba(0, 119, 182, 0.2);
    }

    input.error {
      border-color: var(--error-color);
    }

    .error-message {
      color: var(--error-color);
      font-size: 0.8rem;
      margin-top: 0.25rem;
      display: none;
    }

    /* Button styling */
    .button-group {
      display: flex;
      justify-content: space-between;
      margin-top: 1rem;
      gap: 1rem;
    }

    button {
      padding: 0.75rem 1.5rem;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
    }

    button:disabled {
      opacity: 0.6;
      cursor: not-allowed;
    }

    .btn-primary {
      background-color: var(--primary-color);
      color: white;
    }

    .btn-primary:hover:not(:disabled) {
      background-color: var(--primary-dark);
    }

    .btn-secondary {
      background-color: rgba(255, 255, 255, 0.2);
      color: white;
    }

    .btn-secondary:hover:not(:disabled) {
      background-color: rgba(255, 255, 255, 0.3);
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
      .form-container {
        padding: 1rem;
        margin: 1rem;
      }

      h2 {
        font-size: 1.5rem;
      }

      .button-group {
        flex-direction: column-reverse;
      }

      button {
        width: 100%;
      }
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(10px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>
<div class="form-container">
    <h2>Driver Registration Form</h2>
    
    <div class="progress-container">
        <div class="progress-step active">1</div>
        <div class="progress-step">2</div>
        <div class="progress-step">3</div>
    </div>

    <form action="submit-driver" method="POST" id="driverForm">
        <!-- Personal Information Section -->
        <div class="form-page active" id="page1">
            <h3>Personal Information</h3>
            
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required placeholder="John Doe">
                <div class="error-message">Please enter your full name</div>
            </div>

            <div class="form-group">
                <label for="gender">Gender</label>
                <select id="gender" name="gender" required>
                    <option value="">-- Select --</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
                <div class="error-message">Please select your gender</div>
            </div>

            <div class="form-group">
                <label for="dateOfBirth">Date of Birth</label>
                <input type="date" id="dateOfBirth" name="dateOfBirth" required>
                <div class="error-message">Please enter your date of birth</div>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" required pattern="[0-9]{10}" maxlength="10" placeholder="1234567890">
                <div class="error-message">Please enter a valid 10-digit phone number</div>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" placeholder="123 Main St, City">
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="john.doe@example.com">
            </div>

            <div class="button-group">
                <button type="button" class="btn-primary next-btn">Next</button>
            </div>
        </div>

        <!-- Vehicle Information Section -->
        <div class="form-page" id="page2">
            <h3>Vehicle Information</h3>
            
            <div class="form-group">
                <label for="vehicleModel">Vehicle Model</label>
                <select id="vehicleModel" name="vehicleModel" required>
                    <option value="">-- Select --</option>
                    <option value="Moto">Motorcycle</option>
                    <option value="Tuk">Tuk-tuk</option>
                    <option value="Car">Car</option>
                    <option value="Van">Van</option>
                    <option value="Truk">Truck</option>
                </select>
                <div class="error-message">Please select your vehicle model</div>
            </div>

            <div class="form-group">
                <label for="regNumber">Registration Number</label>
                <input type="text" id="regNumber" name="regNumber" required placeholder="AB12 XYZ" pattern="[A-Za-z0-9 ]{6,10}">
                <div class="error-message">Please enter a valid registration number (6-10 alphanumeric characters)</div>
            </div>

            <div class="form-group">
                <label for="vin">Vehicle Identification Number (VIN)</label>
                <input type="text" id="vin" name="vin" required placeholder="17-character VIN" pattern="[A-HJ-NPR-Z0-9]{17}" maxlength="17">
                <div class="error-message">Please enter a valid 17-character VIN</div>
            </div>

            <div class="button-group">
                <button type="button" class="btn-secondary prev-btn">Previous</button>
                <button type="button" class="btn-primary next-btn">Next</button>
            </div>
        </div>

        <!-- Health & Background Section -->
        <div class="form-page" id="page3">
            <h3>Health & Background</h3>
            
            <div class="form-group">
                <label for="medical">Do you have a valid medical fitness certificate?</label>
                <select id="medical" name="medical" required>
                    <option value="">-- Select --</option>
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select>
                <div class="error-message">Please select an option</div>
            </div>

            <div class="form-group">
                <label for="accidents">Any at-fault accidents in the past 5 years?</label>
                <select id="accidents" name="accidents" required>
                    <option value="">-- Select --</option>
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select>
                <div class="error-message">Please select an option</div>
            </div>

            <div class="button-group">
                <button type="button" class="btn-secondary prev-btn">Previous</button>
                <button type="submit" class="btn-primary">Submit</button>
            </div>
        </div>
    </form>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('driverForm');
        const pages = document.querySelectorAll('.form-page');
        const progressSteps = document.querySelectorAll('.progress-step');
        const nextButtons = document.querySelectorAll('.next-btn');
        const prevButtons = document.querySelectorAll('.prev-btn');
        let currentPage = 0;

        // Show first page by default
        showPage(currentPage);

        // Next button click handler
        nextButtons.forEach(button => {
            button.addEventListener('click', function() {
                if (validatePage(currentPage)) {
                    progressSteps[currentPage].classList.remove('active');
                    progressSteps[currentPage].classList.add('completed');
                    
                    currentPage++;
                    progressSteps[currentPage].classList.add('active');
                    showPage(currentPage);
                }
            });
        });

        // Previous button click handler
        prevButtons.forEach(button => {
            button.addEventListener('click', function() {
                progressSteps[currentPage].classList.remove('active');
                currentPage--;
                progressSteps[currentPage].classList.add('active');
                showPage(currentPage);
            });
        });

        function showPage(index) {
            pages.forEach((page, i) => {
                page.classList.toggle('active', i === index);
            });
        }

        function validatePage(index) {
            const currentPage = pages[index];
            const inputs = currentPage.querySelectorAll('input[required], select[required]');
            let isValid = true;

            inputs.forEach(input => {
                const errorMessage = input.nextElementSibling;
                
                if (!input.value.trim()) {
                    input.classList.add('error');
                    errorMessage.style.display = 'block';
                    isValid = false;
                } else if (input.hasAttribute('pattern')) {
                    const pattern = new RegExp(input.getAttribute('pattern'));
                    if (!pattern.test(input.value)) {
                        input.classList.add('error');
                        errorMessage.style.display = 'block';
                        isValid = false;
                    } else {
                        input.classList.remove('error');
                        errorMessage.style.display = 'none';
                    }
                } else {
                    input.classList.remove('error');
                    errorMessage.style.display = 'none';
                }
            });

            return isValid;
        }
    });
</script>
</body>
</html>