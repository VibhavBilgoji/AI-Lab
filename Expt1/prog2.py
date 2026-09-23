while True:
    print("\n--- ARITHMETIC CALCULATOR MENU ---")
    print("1. Addition (+)")
    print("2. Subtraction (-)")
    print("3. Multiplication (*)")
    print("4. Division (/)")
    print("5. Modulus (%)")
    print("6. Floor Division (//)")
    print("7. Exponentiation (**)")
    print("8. Exit")

    choice = input("Enter your choice (1-8): ")

    if choice == '8':
        print("Exiting calculator...")
        break

    if choice in ['1', '2', '3', '4', '5', '6', '7']:
        num1 = float(input("Enter first number: "))
        num2 = float(input("Enter second number: "))

        if choice == '1':
            print("Result:", num1 + num2)
        elif choice == '2':
            print("Result:", num1 - num2)
        elif choice == '3':
            print("Result:", num1 * num2)
        elif choice == '4':
            if num2 != 0:
                print("Result:", num1 / num2)
            else:
                print("Error: Division by zero is not allowed.")
        elif choice == '5':
            if num2 != 0:
                print("Result:", num1 % num2)
            else:
                print("Error: Modulus by zero is not allowed.")
        elif choice == '6':
            if num2 != 0:
                print("Result:", num1 // num2)
            else:
                print("Error: Floor division by zero is not allowed.")
        elif choice == '7':
            print("Result:", num1 ** num2)
    else:
        print("Invalid choice! Please select a valid option (1-8).")
