const AWS = require('aws-sdk');
require('dotenv').config();

AWS.config.update({
    region: process.env.AWS_DEFAULT_REGION,
    accessKeyId: process.env.AWS_ACCESS_KEY_ID,
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY
})

const dynamoClient = new AWS.DynamoDB.DocumentClient();
const TABLE_NAME = "mango_dict_mock_data";
const NEW_TABLE_NAME = "en-mn-dict";

const getMonDefByEng = async (en) => {
    const params = {
        TableName: NEW_TABLE_NAME,
        Key: { en }
    };
    return await dynamoClient.get(params).promise();
};

const getData = async () => {
    const params = {
        TableName: TABLE_NAME
    };
    const chars = await dynamoClient.scan(params).promise();
    console.log(chars);
    return chars;
};

const addOrUpdate = async (char) => {
    const params = {
        TableName: TABLE_NAME,
        Item: char,
    };
    return await dynamoClient.put(params).promise();

};

const getDataById = async (id) => {
    const params = {
        TableName: TABLE_NAME,
        Key: {
            id
        }
    };
    return await dynamoClient.get(params).promise();
};

const deleteData = async (id) => {
    const params = {
        TableName: TABLE_NAME,
        Key: {
            id
        },
    };
    return await dynamoClient.delete(params).promise();
};

module.exports = {
    dynamoClient,
    getData,
    addOrUpdate,
    getDataById,
    deleteData,
    getMonDefByEng
};

// getData();

const mockData = {
    // {
    // "id": "1",
    // "en": "search",
    // "mn": "хайх"
    // },
    // {
    // "id": "2",
    // "en": "close",
    // "mn": "хаах"
    // }
};

// addOrUpdate(mockData);