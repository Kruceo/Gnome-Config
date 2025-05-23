import fs from 'fs'
const input = fs.readFileSync("config.sh", "utf8").split("\n")

let buffer = ""

for (const line of input) {
    // console.log(line)
    const match = line.match(/^(.+) < (.+\.conf)$/)
    if (!match) {
        buffer += `${line}\n`
        continue
    }

    const file = fs.readFileSync(match[2],"utf8").replace(/'/g,"\\'").replace(/\n/g,"\\n")
    
    buffer += `echo $'${file}' | ${match[1]}\n\n`
}


fs.writeFileSync('config.sh',buffer)