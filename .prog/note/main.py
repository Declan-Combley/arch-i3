from sys import argv
from topic import topic

def parse_input(i) -> []:
    for x in range(len(i)):
        i[x] = i[x].strip(",").replace(" ", "")

    return i


def error(string):
    print(f"error: {string}")
    exit(1)


def update_topic(name, text, t):
    t.update(name, text)


def parse_line(line, t):
    i = 2
    unparsedName = []
    unparsedText = []


    if line == "" or line == " ":
        return

    if "|" not in line:
        x = 0

        for i in line:
            if i == " " or i == "":
                x += 1
            else:
                break

        update_topic("text", line[x:], t)

        return

    while line[i] != "|":
        unparsedName += line[i].strip("-").replace(" ", "")
        i += 1
    i += 2

    while i < len(line):
        unparsedText += line[i]
        i += 1

    name = ''.join(unparsedName)
    text = ''.join(unparsedText)

    update_topic(name, text, t)


def get_text(text, delimiter):
    if delimiter == "topic":
        name = []
        i = 1

        while text[i] != ")":
            name.append(text[i])
            i += 1

    return ''.join(name)


def get_topic(lines, lineCounter, parsedLines, x, types) -> int:
    if lines[0].startswith("(") and lines[0].endswith(")"):
        name = get_text(lines[0], "topic")
        t = topic(name, types)

        while "(" not in lines[x] and ")" not in lines[x]:
            if "->" in lines[x]:
                origin = x
                counter = 1
                for i in lines[x:]:
                    if "<-" not in i:
                        counter += 1
                    else:
                        x += counter
                        break
            elif lines[x] == "":
                x += 1
            else:
                parse_line(lines[x], t)
                x += 1
        t.display()
        return x


def main():
    if len(argv) < 3:
        error(f"errror: expected a file path and a header number\nargs: {argv[1:]} is invalid")
    elif len(argv) > 3:
        if argv[3] == "-":
            outputs = parse_input(argv[4:])
        else:
            error(f"error: {argv[2]} is invalid\n Where you trying to get output types?")
    else:
        outputs = None

    filePath = argv[1]

    try:
        headerNumber = int(argv[2]) - 1
        if headerNumber == -1:
            error(f"invalid usage of notes, header number must be greater than 0")
    except:
        if ".note" not in filePath:
            error(f"error: {filePath} is not a note")

        if argv[2] == "all":
            try:
                f = open(filePath, "r")

                for i in f:
                    print(i.removesuffix("\n"))
                return
            except:
                error(f"error: {filePath} does not exist")
        else:
            error(f"invalid usage of notes, header must be a number, [{argv[2]}] is invalid")

    lineCounter = 0
    parsedLines = []
    lines = []

    try:
        f = open(filePath, "r")
        for i in f:
            parsedLines.append(i.removesuffix("\n").strip().replace(" ", ""))
            lines.append(i.removesuffix("\n"))
            lineCounter += 1
    except:
        error(f"error: {filePath} does not exist")

    if ".note" not in filePath:
        error(f"error: {filePath} is not a note")

    functionCounter = 0
    currentLine = 1

    while currentLine <= lineCounter:
        if functionCounter / 2 == headerNumber:
            break
        elif "(" in lines[currentLine] and ")" in lines[currentLine]:
            functionCounter += 1
            currentLine += 1
        else:
            currentLine += 1

    get_topic(lines, lineCounter, parsedLines, currentLine, outputs)

    f.close()


if __name__ == '__main__':
    main()
else:
    error("main.py must be the only python file")
