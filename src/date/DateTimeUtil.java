package date;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateTimeUtil {
    public static String getLaterDate(int i) {
        DateFormat dtf = new SimpleDateFormat("yyyy-MM-dd");
        final Calendar cal = Calendar.getInstance();
        cal.add(cal.DATE, +i);
        return dtf.format(cal.getTime());
    }
}
