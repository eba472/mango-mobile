

# English to Mongolian dictionary
## HTTP POST {base_url}/dict/en/{word}
ex: localhost:8080/dict/en/voluminous

### Response status

**200** for success
**404** for not found
**500** for internal server error (API issue)

### Response body

Fields:

| Name      | Type     | Merriam Webster | Description                         |
| :-------- | :------- | :-------------- | :---------------------------------- |
| word      | String   |                 | Searched  word                      |
| mnDef     | String   |                 | Word definition in Mongolian        |
| enDef[]   | String[] | shortDef        | Several word definition in English  |
| prs       | Object[] | hwi.prs         |                                     |
| prs.mw    | String   | hwi.prs.mw      | Phonetic spelling :  vəˈluː.mə.nəs etc |
| prs.audio | String   | hwi.prs.audio   | Pronunciation audio location        |
| examples  | String[] | suppl.examples  | Example sentences                   |
 


