import AWS from 'aws-sdk';
import * as dotenv from 'dotenv'
dotenv.config()

AWS.config.update({
    region: process.env.AWS_DEFAULT_REGION,
    accessKeyId: process.env.AWS_ACCESS_KEY_ID,
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY
})

const dynamoClient = new AWS.DynamoDB.DocumentClient();
const TABLE_NAME = "en-mn-dict";

export const getMonDefByEng = async (en) => {
    const params = {
        TableName: TABLE_NAME,
        Key: { en }
    };
    return await dynamoClient.get(params).promise();
};
