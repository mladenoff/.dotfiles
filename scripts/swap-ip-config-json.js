const fs = require('fs')
const os = require('os')

const swapConfigJsonIp = () => {
  const configJson = `${os.homedir()}/dev/mobile/config.json`
  const rawData = fs.readFileSync(configJson)
  const parsedData = JSON.parse(rawData)

  if (parsedData.development.apiBaseUrl[7] === 'l') {
    const ipAddress = os.networkInterfaces().en0.find((el) => (el.family === 'IPv4')).address

    parsedData.development.apiBaseUrl = `http://${ipAddress}:3000`

    console.log('Swapped to your wifi IP address')
  } else {
    parsedData.development.apiBaseUrl = 'http://localhost:3000'

    console.log('Swapped to \'localhost:3000\'')
  }

  const newData = JSON.stringify(parsedData, null, 2) // format w/ 2 spaces

  fs.writeFileSync(configJson, newData + '\n')

  return parsedData.development.apiBaseUrl
}

swapConfigJsonIp()
