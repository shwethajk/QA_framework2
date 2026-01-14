# QA End-to-End Automation Framework

This repository demonstrates a **realistic QA automation setup** with:
- UI Automation: Selenium + Java + TestNG + POM
- API Automation: Postman + Newman
- Database validation: SQL
- CI: GitHub Actions

## Pipeline Flow
1. Trigger on every push / pull request
2. Run API tests using Newman
3. If API tests pass → run UI smoke tests
4. Build fails on any test failure

## How to run locally

### API tests
```bash
npm install -g newman
newman run api-tests/postman_collection.json -e api-tests/postman_environment.json
```

### UI tests
```bash
cd ui-tests
mvn test
```

## CI
Pipeline runs automatically via GitHub Actions after every push.
