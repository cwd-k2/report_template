import os

import numpy as np
import matplotlib.pyplot as plt

from sys import stdin
from sys import argv

from pathlib import Path

project_root = Path(os.environ['PROJECT_ROOT'])

if __name__ == '__main__':

    material = argv[1]
    cross    = float(argv[2])

    analog_1 = []
    analog_2 = []
    analog_9 = []

    for _ in range(13):
        input()

    for l in stdin:
        [a, b, c] = list(map(float, l.rstrip().split(',')[1:]))
        analog_1.append(a)
        analog_2.append(b)
        analog_9.append(c)

    analog_1 = np.array(analog_1)
    analog_2 = np.array(analog_2)
    analog_9 = np.array(analog_9)

    stress = analog_1 * 2000 / cross
    guage  = analog_2 / 4 / 5.75
    strain = analog_9 / 5.75

    guage_true  = np.log(1 + guage)
    strain_true = np.log(1 + strain)

    stress_g_true = stress * (1 + guage)
    stress_s_true = stress * (1 + strain)

    plt.title(r"真応力 - 真ひずみ (%s)" % material)

    plt.xlabel(r"真ひずみ [-]")
    plt.ylabel(r"真応力 [MPa]")

    plt.xlim(0, strain_true.max()   * 1.1)
    plt.ylim(0, stress_s_true.max() * 1.2)

    plt.plot(strain_true, stress_s_true, label=r"ストローク")
    plt.plot(guage_true,  stress_g_true, label=r"ひずみゲージ")

    plt.legend(frameon=False)

    plt.savefig(project_root / 'resources' / 'tensile' / (material + '_true.pgf'))
