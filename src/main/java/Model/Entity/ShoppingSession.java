package Model.Entity;

import java.util.List;

public class ShoppingSession {
    private int id;
    private int user_id;
    private List<CartItem> products;
    private int total;
    private int created_at;

    public int getId() {
        return id;
    }

    public List<CartItem> getProducts() {
        return products;
    }

    public void setProducts(List<CartItem> listItems) {
        this.products = listItems;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getCreated_at() {
        return created_at;
    }

    public void setCreated_at(int created_at) {
        this.created_at = created_at;
    }
}
