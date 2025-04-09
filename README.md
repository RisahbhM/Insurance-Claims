🚀 GenAI-Powered Medical Coding Automation

Extract ICD-10 codes from clinical notes using Amazon Bedrock & AWS serverless stack

🧠 Project Summary

This project automates medical coding using Generative AI and AWS services, eliminating human error in ICD-10 classification and accelerating healthcare insurance claims.

💼 Business Problem & Impact

Area

Manual Coding

GenAI Automation

Processing Speed

3-5 days

Minutes ⏱️

Human Involvement

100% manual coders

60% reduction 👨‍⚕️

Revenue Flow

Delayed reimbursements

15-20% faster 💰

🔧 AWS Services Used

🧠 Amazon Bedrock – Claude/Titan LLM for ICD-10 generation

🧬 Lambda – Executes medical code extraction

🌐 API Gateway – Exposes RESTful endpoint

🗂️ Amazon S3 – Stores clinical input/output

📊 DynamoDB – Logs predictions & outputs

🔐 Cognito – User authentication for billing teams

🔎 CloudWatch + X-Ray – Observability, debugging

📦 Terraform – IaC for clean modular deployment

📁 Project Directory Structure

📁 genai-medical-coding
├── main.tf                      # Root Terraform config
├── variables.tf
├── outputs.tf
├── .gitignore
├── lambda_function_payload.zip # Lambda deployment package
├── lambda_code/
│   └── lambda_function.py       # Main LLM prompt logic
├── modules/
│   ├── api_gateway/
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── cognito/
│   │   └── main.tf
│   ├── dynamodb/
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── lambda/
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── observability/
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── s3/
│   │   ├── main.tf
│   │   └── variables.tf
│   └── vpc/
│       ├── main.tf
│       └── variables.tf
└── CLEANUP.md                  # Billing-safe teardown guide

📦 Deployment Steps

Step 1: Clone and Navigate

git clone https://github.com/<your-username>/genai-medical-coding.git
cd genai-medical-coding

Step 2: Package Lambda Code

cd lambda_code
zip lambda_function_payload.zip lambda_function.py
mv lambda_function_payload.zip ../

Step 3: Initialize & Apply Infrastructure

terraform init
terraform plan
terraform apply

Step 4: Test API with Sample Request

curl -X POST "<API_URL>/code" \
  -H "Content-Type: application/json" \
  -d '{"text": "Patient has Type 2 Diabetes Mellitus and Hypertension."}'

✅ Sample Output:

{
  "codes": "E11 - Type 2 diabetes mellitus, I10 - Hypertension"
}

ℹ️ Get your API_URL from: terraform output api_gateway_url

🧹 Cleanup (To Stop Billing)

terraform destroy

Then revoke model access:
👉 https://console.aws.amazon.com/bedrock/home#/modelaccess

🧪 Demo Snapshots (Suggested)

✅ Lambda response with ICD-10 codes

✅ API Gateway + Bedrock architecture diagram

✅ CloudWatch logs & traces

✅ Bedrock model access screenshot

📄 License

MIT License

👤 Author

Rishabh Ravi MadneAWS | Cloud Architect | GenAI in Healthcare🔗 https://www.linkedin.com/in/rishabh-madne-9998b1186/📬 risahbhmadne16@outlook.com

This is a real-world GenAI x Cloud project for healthcare claims automation — ready for your resume, GitHub, or employer pitch!

