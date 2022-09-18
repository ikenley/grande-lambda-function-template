import { S3Event } from 'aws-lambda';

const { VERSION } = process.env;

export const handler = async (event: S3Event) => {
  console.log('VERSION', VERSION);

  console.log('event', JSON.stringify(event, null, 2));

  const response = {
    statusCode: 200,
    body: JSON.stringify('Hello from Lambda!'),
  };
  return response;
};

export default handler;
