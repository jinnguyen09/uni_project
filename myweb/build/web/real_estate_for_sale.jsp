    <%-- 
        Document   : real_estate_for_sale
        Created on : Oct 24, 2024, 2:20:51 AM
        Author     : Trung
    --%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <jsp:include page="menu.jsp" />
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>

            <style>
                .real_estate_for_sale{
                    background-color: white;
                    padding: 0;
                }

                .filter_by_price{
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    margin-left: 1050px;
                    margin-top: 150px;
                }
                aside{
                    background-color: #fff;
                    border: 1px solid rgba(0, 0, 0, 0.05);
                    width: 200px;
                    height: 570px;
                    border-radius: 7px;
                }

                aside h4{
                    margin-left: 15px;
                    font-size: 17px;
                }
                aside p{
                    margin-left: 20px;
                }

                aside p a{
                    color: inherit;
                    text-decoration: none;
                }

                aside p:hover{
                    color: #ccc;
                    cursor: pointer;
                }

                .filter_by_size{
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    margin-left: 1050px;
                    margin-top: 20px;
                }

                .filter_by_size aside{
                    background-color: #fff;
                    border: 1px solid rgba(0, 0, 0, 0.05);
                    width: 200px;
                    height: 450px;
                    border-radius: 7px;
                }

                .real_estate{
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    margin-left: 1050px;
                    margin-top: 20px;
                }

                .real_estate aside{
                    background-color: #F2F2F2;
                    border: 1px solid rgba(0, 0, 0, 0.05);
                    width: 200px;
                    height: 450px;
                    border-radius: 7px;
                }

                .real_estate aside details summary{
                    color: red;
                    cursor: pointer;
                    list-style: none;
                    margin-left: 20px;
                    font-size: 17px;
                }

                details[open]{
                    background-color: #F2F2F2;
                    height: 380px;
                }


                .bi-chevron-compact-down{
                    font-size: 15px;
                    color: red;
                }

                .featured_articles{
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    margin-left: 1050px;
                    margin-top: 20px;
                }

                .featured_articles aside{
                    background-color: white;
                    border: 1px solid rgba(0, 0, 0, 0.05);
                    width: 200px;
                    height: 480px;
                    border-radius: 7px;
                }

                .featured_articles aside hr{
                    border: 1px solid rgba(0, 0, 0, 0.03);
                    width: 80%;
                }
            </style>
        </head>
        <body>
            <div class="real_estate_for_sale">
                <div class="search">
                    
                </div>
                <div class="filter_by_price">
                    <aside>
                        <h4>Lọc theo khoảng giá</h4>
                        <p><a href="#">Thỏa thuận</a></p>
                        <p><a href="#">Dưới 500 triêu</a></p>
                        <p><a href="#">500 - 800 triệu</a></p>
                        <p><a href="#">800 - 1 tỷ</a></p>
                        <p><a href="#">1 - 2 tỷ</a></p>
                        <p><a href="#">2 - 3 tỷ</a></p>
                        <p><a href="#">3 - 5 tỷ</a></p>
                        <p><a href="#">5 - 7 tỷ</a></p>
                        <p><a href="#">7 - 10 tỷ</a></p>
                        <p><a href="#">10 - 20 tỷ</a></p>
                        <p><a href="#">20 - 30 tỷ</a></p>
                        <p><a href="#">20 - 30 tỷ</a></p>
                        <p><a href="#">30 - 40 tỷ</a></p>
                        <p><a href="#">40 - 60 tỷ</a></p>
                        <p><a href="#">Trên 60 tỷ</a></p>
                    </aside>
                </div>

                <div class="filter_by_size">
                    <aside>
                        <h4>Lọc theo kích thước</h4>
                        <p><a href="#">Dưới 30m<sup>2</sup></a></p>
                        <p><a href="#">30 - 50m<sup>2</sup></a></p>
                        <p><a href="#">50 - 80m<sup>2</sup></a></p>
                        <p><a href="#">80 - 100m<sup>2</sup></a></p>
                        <p><a href="#">100 - 150m<sup>2</sup></a></p>
                        <p><a href="#">150 - 200m<sup>2</sup></a></p>
                        <p><a href="#">200 - 250m<sup>2</sup></a></p>
                        <p><a href="#">250 - 300m<sup>2</sup></a></p>
                        <p><a href="#">300 - 500m<sup>2</sup></a></p>
                        <p><a href="#">Trên 500m<sup>2</sup></a></p>
                    </aside>
                </div>

                <div class="real_estate">
                    <aside>
                        <h4>Mua bán nhà đất</h4>
                        <p><a href="#">Hồ Chí Minh</a></p>
                        <p><a href="#">Hà Nội</a></p>
                        <p><a href="#">Đà Nẵng</a></p>
                        <p><a href="#">Bình Dương</a></p>
                        <p><a href="#">Khánh Hòa</a></p>
                        <p><a href="#">Đồng Nai</a></p>
                        <p><a href="#">Hải Phòng</a></p>
                        <p><a href="#">Bà Rịa Vũng Tàu</a></p>
                        <p><a href="#">Long An</a></p>
                        <p><a href="#">Hưng Yên</a></p>
                        <details>
                            <summary>Xem thêm <i class="bi bi-chevron-compact-down"></i></summary>
                        <p><a href="#">Lâm Đồng</a></p>
                        <p><a href="#">Quảng Ninh</a></p>
                        <p><a href="#">Bình Thuận</a></p>
                        <p><a href="#">Hòa Bình</a></p>
                        <p><a href="#">Bắc Ninh</a></p>
                        <p><a href="#">Quảng Nam</a></p>
                        <p><a href="#">Thanh Hóa</a></p>
                        <p><a href="#">Tây Ninh</a></p>
                        <p><a href="#">Bình Phước</a></p>
                        <p><a href="#">Thái Nguyên</a></p>
                        </details>
                    </aside>
                </div>

                <div class="featured_articles">
                    <aside>
                        <h4>Bài viết được quan tâm</h4>
                        <hr>
                        <p><a href="#">Trọn Bộ Lãi Suất Vay Mua Nhà Mới Nhất Tháng 10/2024</a></p><hr>
                        <p><a href="#">Thị Trường BĐS Tháng 9/2024: Giảm Mạnh Lượt Tìm Kiếm Do Bão Yagi?</a></p><hr>
                        <p><a href="#">BĐS Khánh Hòa Tháng 7/2024: Lượt Tìm Kiếm Bất Ngờ Tăng Mạnh</a></p><hr>
                        <p><a href="#">Đất Nền Vành Đai 4 “Nổi Sóng” Cuối Năm 2024</a></p><hr>
                        <p><a href="#">Đất Nền Đông Anh (Hà Nội) Tiếp Tục Sốt Nóng “Bỏng Tay”</a></p>
                    </aside>
                </div>
            </div>
        </body>
    </html>
