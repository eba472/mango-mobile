// FUNCTION FOR SEEDING DICTIONARY DATA TO THE MANGO DICT DATABASE
const axios = require('axios');
const {addOrUpdate} = require('./dynamo');

const seedData = async () => {
    const url = 'http://hp-api.herokuapp.com/api/characters'; // THIS API IS FOR THE TESTING FUNCTION
    try {
        const {'data': dictData} = await axios.get(url);
        const dataPromises = dictData.map((dictData, i) => 
            addOrUpdate({... dictData, 'id': i + ''}))
        await Promise.all(dataPromises);
    } catch (e) {

    }
};

// seedData();