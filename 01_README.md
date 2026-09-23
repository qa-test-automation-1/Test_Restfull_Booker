
# QA Automation – Restful Booker

Test automation project for the **Restful Booker Platform**.

The project covers functional, API, performance and security testing of a
web application and its REST API.

## Application Under Test

**Restful Booker Platform**

🔗 https://automationintesting.online/

## Testing Scope

- **UI Testing** – Playwright
- **API Testing** – Postman / Newman
- **Performance Testing** – Apache JMeter
- **Security Testing** – OWASP-based testing
- **CI/CD** – GitHub Actions
- **Containerization** – Docker

## Project Structure

```text
QA-AUTOMATION/
│
├── README.md
│
├── docs/
│   ├── 01_test_plan.md
│   ├── 02_test_case_postman.md
│   └── 03_test_case_jmeter.md
│
├── postman/
│   ├── collections/
│   ├── environments/
│   └── reports/
│
├── jmeter/
│   ├── tests/
│   └── reports/
│
├── playwright/
│   ├── tests/
│   └── reports/
│
├── reports/
│
├── .github/
│   └── workflows/
│
├── Dockerfile
└── .gitignore


