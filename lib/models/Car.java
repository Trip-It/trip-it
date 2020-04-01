/**
 *
 */
package org.tripplanner.cars;

import org.tripplanner.utils.Util;

/**

 */
public class RenaultZoeR110_52 implements Car {
    private final static double carWeight = 1502;

    private final static double scx = 0.75;

    private final static double battery = 52000;

    private final static double crr = 0.011;

    private static final double lights = 105;

    private static final double[] clim = new double[] { 1300, 620, 520, 200, 0, 500 };

    private static final Integer[] TEMPERATURE = new Integer[] { 0, 5, 10, 15, 20, 25 };

    private static final double[] EFFICIENCY = { 0.72, 0.72, 0.72, 0.72, 0.75, 0.78, 0.82, 0.85, 0.85, 0.85, 0.85,
            0.85 };

    public static final double[] SPEEDS = { 0, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130 };

    public static final String NAME = "Zoe R110 52kWh";

    public double getBattery() {
        return battery;
    }

    @Override
    public String getName() {
        return NAME;
    }

    @Override
    public double getWeight() {
        return carWeight;
    }

    @Override
    public double getSCx() {
        return scx;
    }

    @Override
    public double getCrr() {
        return crr;
    }

    @Override
    public double getLights() {
        return lights;
    }

    @Override
    public double getClim(int temp) {
        int index = Util.getAmong(TEMPERATURE, temp);
        return clim[index];
    }

    @Override
    public double getEfficiency(int speed) {
        return Util.interpolate(SPEEDS, EFFICIENCY, speed);
    }
}
