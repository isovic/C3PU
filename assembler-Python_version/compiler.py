#This is a compiler for a homemade cpu, it output machine code

filename = "cpu.txt"
i = 1
a = ""
b = ""
c = ""
commandArray = [];
print("This is a compiler for a homemade cpu, it output machine code.")
print("The file cpu.txt contain all the commands")
print("Don't forget to write yourfilname.txt")
print("")
print("Chose a file to convert:")
filename = input(">  ")
print("Chose a name for the output:")
new_filename = input(">  ")
f = open(filename, 'r').readlines()

for line in f:
    line = line.rstrip();

    if line.startswith("NOP"):
        a =("0000000000000000")
        tempWords = line.split();
        commandArray.append('"'+a+'" ,  --'+line);
        
    if line.startswith("LOAD"):
        a =("00001")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(8)
        c = bin(int(tempWords[2]))[2:]
        c = str(c);
        c = c.zfill(3)
        commandArray.append('"'+a+b+c+'" ,  --'+line);
    
    if line.startswith("STORE"):
        a =("00010")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(8)
        c = bin(int(tempWords[2]))[2:]
        c = str(c);
        c = c.zfill(3)
        commandArray.append('"'+a+b+c+'" ,  --'+line);
        
    if line.startswith("MOV"):
        a =("00011")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(8)
        c = bin(int(tempWords[2]))[2:]
        c = str(c);
        c = c.zfill(3)
        commandArray.append('"'+a+b+c+'" ,  --'+line);

    if line.startswith("JMP"):
        a =("00101")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(11)
        commandArray.append('"'+a+b+'" ,  --'+line);

    if line.startswith("JMPI"):
        a =("00110")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(11)
        commandArray.append('"'+a+b+'" ,  --'+line);

    if line.startswith("INC"):
        a =("00111")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(11)
        commandArray.append('"'+a+b+'" ,  --'+line);

    if line.startswith("DEC"):
        a =("01000")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(11)
        commandArray.append('"'+a+b+'" ,  --'+line);

    if line.startswith("AND"):
        a =("01001")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(8)
        c = bin(int(tempWords[2]))[2:]
        c = str(c);
        c = c.zfill(3)
        commandArray.append('"'+a+b+c+'" ,  --'+line);

    if line.startswith("OR"):
        a =("01010")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(8)
        c = bin(int(tempWords[2]))[2:]
        c = str(c);
        c = c.zfill(3)
        commandArray.append('"'+a+b+c+'" ,  --'+line);

    if line.startswith("XOR"):
        a =("01011")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(8)
        c = bin(int(tempWords[2]))[2:]
        c = str(c);
        c = c.zfill(3)
        commandArray.append('"'+a+b+c+'" ,  --'+line);

    if line.startswith("NOT"):
        a =("01100")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(8)
        c = bin(int(tempWords[2]))[2:]
        c = str(c);
        c = c.zfill(3)
        commandArray.append('"'+a+b+c+'" ,  --'+line);

    if line.startswith("ADD"):
        a =("01101")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(8)
        c = bin(int(tempWords[2]))[2:]
        c = str(c);
        c = c.zfill(3)
        commandArray.append('"'+a+b+c+'" ,  --'+line);

    if line.startswith("SUB"):
        a =("01110")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(8)
        c = bin(int(tempWords[2]))[2:]
        c = str(c);
        c = c.zfill(3)
        commandArray.append('"'+a+b+c+'" ,  --'+line);

    if line.startswith("ZERO"):
        a =("01111")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(11)
        commandArray.append('"'+a+b+'" ,  --'+line);

    if line.startswith("END"):
        a =("1000100000000000")
        commandArray.append('"'+a+'" ,  --'+line);

    if line.startswith("SHL"):
        a =("10010")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(11)
        commandArray.append('"'+a+b+'" ,  --'+line);

    if line.startswith("SHR"):
        a =("10011")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(11)
        commandArray.append('"'+a+b+'" ,  --'+line);

    if line.startswith("ROTR"):
        a =("10100")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(11)
        commandArray.append('"'+a+b+'" ,  --'+line);

    if line.startswith("ROTL"):
        a =("10101")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(11)
        commandArray.append('"'+a+b+'" ,  --'+line);

    if line.startswith("MUL"):
        a =("10110")
        tempWords = line.split();
        b = bin(int(tempWords[1]))[2:]
        b = str(b);
        b = b.zfill(8)
        c = bin(int(tempWords[2]))[2:]
        c = str(c);
        c = c.zfill(3)
        commandArray.append('"'+a+b+c+'" ,  --'+line);
        print (commandArray);   


out = '\n'.join(commandArray);

f = open(new_filename, "w")
f.write(out)
f.close()
