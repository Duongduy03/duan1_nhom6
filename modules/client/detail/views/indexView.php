<?php get_header('','Trang chủ')

?>
<main class="content-detail">
    
            <div class="content1">
                <form action="" method="post" enctype="multipart/form-data">
                <div class="content__product--detail row row-12">
                    <div class="product__detail--img--box col-6">
                        <img src="public/uploads/<?= $room_detail['thumb']?>"
                            alt="" class="product__detail--img">
                    </div>

                    <div class="product__detail--info--box col-6">
                        <p class="product__name">
                            <?=  $room_detail['title']?>
                        </p>
                        <p class="product__price">
                            <?=  $room_detail['price']?><span>$</span>
                        </p>
                        <div class="product__quantity--box">
                            <label class="product__quantity--label">Số lượng:</label>
                            <p class="product__quantity">
                               <?=  $room_detail['count']?>
                            </p>
                        </div>

                        <div class="product__buy--form">
                            <form action="" method="Post">
                                <div class="product__buy--value--box">
                                    <label class="product__buy--value--title"> Ngày đặt </label>
                                    <input type="date" min="1" max="" class="product__date">
                                </div>
                                <?php if(isset($_SESSION['auth']['role']) && $_SESSION['auth']['role']== 1){ ?>
                                <div class="product__buy--function">
                                   
                                   <button class="product__buy--function--buy--now">Đặt Phòng
                                        Ngay</button>
                                   
                               
                                </div>
                                <?php }else{?>
                                  
                                    <?php }?>
                            </form>
                            <div class="product__description--box">
                                <label class="product__description--label">Mô tả phòng:</label>
                                <p class="product_description">
                                    <?=  $room_detail['description']?>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
                
                <form action="" enctype="multipart/form-data" method="post">
                    <div class="user--ratting--value--box">
                        <label>Sao</label>
                        <input type="number" min="1" max="5" name="so_sao_ratting" class="user--ratting--start">
                      
                    </div>
                    <div class="user--ratting--value--box">
                        <label>Bình luận</label>
                        <textarea name="comment" id="" cols="30" rows="10" class="user--ratting--comment" placeholder="Đánh giá của bạn về sản phẩm..."></textarea>
                        <!-- s -->
                    </div>
                    <input type="hidden" name="id_khach_hang" value="" />
                    <input type="hidden" name="id_phong" value="" />
                    <button type="submit" class="submit-comment" name="submit-comment" >Gửi</button>
                </form>

            </div>



    </div>
    </main>

<?php get_footer()?>