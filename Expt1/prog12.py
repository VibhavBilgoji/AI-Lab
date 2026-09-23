def get_gp(pct):
    if pct >= 85:
        return 10
    elif pct >= 75:
        return 9
    elif pct >= 65:
        return 8
    elif pct >= 55:
        return 7
    elif pct >= 45:
        return 6
    elif pct >= 40:
        return 5
    else:
        return 0


num_students = int(input("Enter number of students: "))

for s in range(num_students):
    print(f"\n=== Entering Details for Student {s + 1} ===")
    name = input("Enter Student Name: ")
    roll_no = input("Enter Roll No: ")
    seat_no = input("Enter Seat No: ")
    program = input("Enter Program: ")

    sem_sgpa = []
    sem_details = []
    grand_obtained_marks = 0
    grand_max_marks = 0

    for sem in range(1, 3):
        print(f"\n--- Semester {sem} Input ---")
        base_subjects = []
        for i in range(1, 6):
            base_subjects.append(input(f"Enter name of Subject {i}: "))

        courses = []
        for sub in base_subjects:
            courses.append(sub)
            courses.append(sub + " Lab")

        total_credits = 0
        total_points = 0
        sem_list = []

        print(f"\nEnter marks for 10 courses (5 Theory + 5 Labs) of Semester {sem}:")
        for item in courses:
            print(f"\nFor Course: {item}")
            it_marks = float(input("  Enter IT marks: "))
            final_marks = float(input("  Enter Final exam marks: "))
            credits = float(input("  Enter credits: "))

            tot_marks = it_marks + final_marks
            max_marks = credits * 25
            pct = (tot_marks / max_marks * 100) if max_marks > 0 else 0
            gp = get_gp(pct)

            total_credits += credits
            total_points += credits * gp
            grand_obtained_marks += tot_marks
            grand_max_marks += max_marks

            sem_list.append((item, credits, it_marks, final_marks, tot_marks, max_marks, gp))

        sgpa = total_points / total_credits if total_credits > 0 else 0
        sem_sgpa.append(sgpa)
        sem_details.append(sem_list)

    cgpa = (sem_sgpa[0] + sem_sgpa[1]) / 2

    print("\n" + "=" * 75)
    print("                           REPORT CARD                           ")
    print("=" * 75)
    print(f"Name    : {name:<30} Roll No : {roll_no}")
    print(f"Program : {program:<30} Seat No : {seat_no}")
    print("=" * 75)

    for sem in range(1, 3):
        print(f"\n--- SEMESTER {sem} RESULTS ---")
        print(f"{'Course Name':<22}{'Credits':<10}{'IT Marks':<10}{'Final':<10}{'Total':<8}{'Max':<8}{'GP':<5}")
        print("-" * 75)
        for sub, cr, it, fn, tot, mx, gp in sem_details[sem - 1]:
            print(f"{sub:<22}{cr:<10.1f}{it:<10.1f}{fn:<10.1f}{tot:<8.1f}{mx:<8.1f}{gp:<5}")
        print(f"Semester {sem} SGPA: {sem_sgpa[sem - 1]:.2f}")

    print("=" * 75)
    print(f"Final CGPA         : {cgpa:.2f}")
    print("=" * 75 + "\n")
