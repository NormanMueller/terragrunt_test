import boto3

def lambda_handler(event, context):
    
    client = boto3.client('dynamodb')
    data = client.put_item(
    TableName='your-table-name',
    Item={
        'id': {
          'S': '005'
        },
        'price': {
          'N': '500'
        },
        'name': {
          'S': 'Yeezys'
        }
    }
  )
    print("hi")
    result = "Hello World and Sky"
    return {
        'statusCode' : 200,
        'body': result
    }