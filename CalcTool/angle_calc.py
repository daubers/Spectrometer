import argparse
import math


def calculate_angle_r(lines_per_mm, wavelength):
    lines_per_m = lines_per_mm*(1/0.001)
    separation = 1/lines_per_m
    return math.asin((wavelength*math.pow(10, -9))/separation)


def calculate_angle_d(lines_per_mm, wavelength):
    return calculate_angle_r(lines_per_mm, wavelength)*(180/math.pi)

parser = argparse.ArgumentParser(description='Calculate the Angle of first order diffraction grating spectrum')
parser.add_argument('lines_per_mm', metavar='N', type=int, nargs='+',  help='an integer for the accumulator')
parser.add_argument('wavelength', metavar='N', type=int, nargs='+',  help='an integer for the accumulator')

args = parser.parse_args()
