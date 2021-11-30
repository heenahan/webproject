package dto;

import java.sql.Date;
import java.sql.Time;

public class Order {
    private String id;
    private Date order_date;
    private Time order_time;
    private Date pickup_date;
    private Time pickup_time;

    public Order(String id, Date order_date, Time order_time, Date pickup_date, Time pickup_time) {
        this.id = id;
        this.order_date = order_date;
        this.order_time = order_time;
        this.pickup_date = pickup_date;
        this.pickup_time = pickup_time;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public Time getOrder_time() {
        return order_time;
    }

    public void setOrder_time(Time order_time) {
        this.order_time = order_time;
    }

    public Date getPickup_date() {
        return pickup_date;
    }

    public void setPickup_date(Date pickup_date) {
        this.pickup_date = pickup_date;
    }

    public Time getPickup_time() {
        return pickup_time;
    }

    public void setPickup_time(Time pickup_time) {
        this.pickup_time = pickup_time;
    }

}
