import boto3
import json

def lambda_handler(event, context):
    try:
        # Extract input
        body = json.loads(event['body'])
        input_text = body.get('text', '')

        if not input_text:
            raise ValueError("Missing 'text' in request.")

        # Claude requires prompts in this format
        prompt = f"\n\nHuman: Extract ICD-10 codes from the following clinical note:\n\n{input_text}\n\nAssistant:"

        bedrock = boto3.client('bedrock-runtime')

        payload = json.dumps({
            "prompt": prompt,
            "max_tokens_to_sample": 300,
            "temperature": 0.5
        })

        response = bedrock.invoke_model(
            modelId="anthropic.claude-instant-v1",  # or use claude-v2 if access is granted
            contentType="application/json",
            accept="application/json",
            body=payload
        )

        result = json.loads(response['body'].read())
        codes = result.get('completion', 'No codes found.')

        return {
            'statusCode': 200,
            'body': json.dumps({'codes': codes})
        }

    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }

