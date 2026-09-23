a = float(input("Enter first number (a): "))
b = float(input("Enter second number (b): "))
c = float(input("Enter third number (c): "))

if a >= b and a >= c:
    largest = a
elif b <= c:
    largest = c
else:
    largest = b

print("Largest number:", largest)
