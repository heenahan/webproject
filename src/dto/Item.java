package dto;

public class Item {
    private Integer oid; //고유번호
    private String name; //아이템 이름
    private String image; //이미지
    private Integer originalPrice; //원래 가격
    private Integer eventPrice; //이벤트 가격
    private String description; //설명
    private String category; //분류
    private String eventTag; //이벤트 태그

    public Item(Integer oid, String name, String image, Integer originalPrice, Integer eventPrice,
                String description, String category, String eventTag) {
        this.oid = oid;
        this.name = name;
        this.image = image;
        this.originalPrice = originalPrice;
        this.eventPrice = eventPrice;
        this.description = description;
        this.category = category;
        this.eventTag = eventTag;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(Integer originalPrice) {
        this.originalPrice = originalPrice;
    }

    public Integer getEventPrice() {
        return eventPrice;
    }

    public void setEventPrice(Integer eventPrice) {
        this.eventPrice = eventPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getEventTag() {
        return eventTag;
    }

    public void setEventTag(String eventTag) {
        this.eventTag = eventTag;
    }
}
