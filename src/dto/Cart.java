package dto;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

public class Cart {
    private String id;
    private Item item;
    private Date date;
    private Time time;

    public Cart(String id, Item item, Date date, Time time) {
        this.id = id;
        this.item = item;
        this.date = date;
        this.time = time;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }
}
