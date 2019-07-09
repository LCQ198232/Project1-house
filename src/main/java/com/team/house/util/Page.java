package com.team.house.util;

public class Page {
    private Integer page=1;//设置默认值

    private Integer rows=3;//设置默认值

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }
}
