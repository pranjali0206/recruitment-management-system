
package utils;

public class Conversion {

    public String arrayToCommaSeparatedString(String[] inputArray) {
        if (inputArray == null || inputArray.length == 0) {
            return "";
        }
        return String.join(",", inputArray);
    }
}