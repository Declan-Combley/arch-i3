class topic:
    def __init__(self, name, outputs):
        self.name = name
        self.outputs = outputs
        self.reminder = []
        self.formula = []
        self.person = []
        self.quote = []
        self.shell = []
        self.textA = []
        self.note = []
        self.date = []
        self.fact = []
        self.eg = []

    def display(self):
        if self.outputs == None:
            print(f"note: {self.note}")
            print(f"quote: {self.quote}")
            print(f"date: {self.date}")
            print(f"formula: {self.formula}")
            print(f"person: {self.person}")
            print(f"reminder: {self.reminder}")
            print(f"fact: {self.fact}")
            print(f"text: {self.textA}")
            print(f"shell: {self.shell}")
            print(f"eg: {self.eg}")
            return

        for i in self.outputs:
            if i == "topic":
                print(f"topic: {self.name}")
            elif i == "note":
                print(f"note: {self.note}")
            elif i == "quote":
                print(f"quote: {self.quote}")
            elif i == "date":
                print(f"date: {self.date}")
            elif i == "formula":
                print(f"formula: {self.formula}")
            elif i == "person":
                print(f"person: {self.person}")
            elif i == "reminder":
                print(f"reminder: {self.reminder}")
            elif i == "fact":
                print(f"fact: {self.fact}")
            elif i == "text":
                print(f"text: {self.textA}")
            elif i == "shell":
                print(f"shell: {self.shell}")
            elif i == "eg":
                print(f"eg: {self.eg}")
            else:
                print(f"{i} is invalid, expected one of the following \nnote, quote, date, reminder, formula, person, reminder or fact")
                exit(1)


    def update(self, name, text):
        if name == "note":
            self.note.append(text)
        elif name == "quote":
            self.quote.append(text)
        elif name == "date":
            self.date.append(text)
        elif name == "formula":
            self.formula.append(text)
        elif name == "person":
            self.person.append(text)
        elif name == "reminder":
            self.reminder.append(text)
        elif name == "fact":
            self.fact.append(text)
        elif name == "text":
            self.textA.append(text)
        elif name == "eg":
            self.eg.append(text)
        elif name == "shell":
            self.shell.append(text)
        else:
            print(f"error: {name} is an invalid note type")
            exit(1)
