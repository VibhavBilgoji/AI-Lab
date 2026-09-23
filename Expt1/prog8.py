import math

def calculate_circle_area(radius):
    area = math.pi * (radius ** 2)
    print(f"The area of the circle with radius {radius} is: {area:.2f}")

r = float(input("Enter radius of the circle: "))
calculate_circle_area(r)
