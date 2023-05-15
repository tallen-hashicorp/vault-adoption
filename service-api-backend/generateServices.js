var random_name = require('node-random-name');
var dockerNames = require('docker-names');

const images=[
    "photo-1451187580459-43490279c0fa",
    "photo-1600907055749-d6cc7e75efd4",
    "photo-1514888286974-6c03e2ca1dba",
    "photo-1543466835-00a7907e9de1",
    "photo-1683029240907-1b195812422c",
    "photo-1682480083604-69c8c1f78be0",
    "photo-1681828469364-3c65c6292a61",
    "photo-1681158705479-075bb1c38a31"

]

function generateServices(count){
    // HardCode Tenant1 used Through this demo
    let services = [{
        id: 0,
        name: "dockerNames.getRandomName(true)",
        email: email,
        imageUrl: image,
        role: role,
        approved: Math.random() < 0.5,
      }]
    for (let index = 1; index < count+1; index++) {
        const email = random_name({ random: Math.random }).toLowerCase().replace(/\s/g, '.') + "@hashicorp.com";
        const name = dockerNames.getRandomName(true);
        const role = name.split("_")[1]
        const image = 'https://images.unsplash.com/' + images[Math.floor(Math.random()*images.length)] + '?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'
        services.push({
            id: index,
            name: dockerNames.getRandomName(true),
            email: email,
            imageUrl: image,
            role: role,
            approved: Math.random() < 0.5,
          })
    }
    return(services)
}

module.exports = generateServices;