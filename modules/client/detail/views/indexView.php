<?php get_header('','Trang chủ');

?>
<main class="content-detail">
    
            <div class="content1">
               
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
                   
                                <div class="product__buy--value--box">
                                    <label class="product__buy--value--title"> Ngày đặt </label>
                                    <input type="date" min="1" max="" class="product__date">
                                </div>
                                <?php if(isset($_SESSION['auth']['role']) && $_SESSION['auth']['role']== 1){ ?>
                                <div class="product__buy--function">
                                   <a href="?role=client&mod=detail&action=booking&id_room=<?= $room_detail['id']?>">
                                   <button class="product__buy--function--buy--now">Đặt Phòng
                                        Ngay</button>
                                   </a>
                                   
                                   
                               
                                </div>
                                <?php }else{?>
                                  
                                    <?php }?>
                        
                            <div class="product__description--box">
                                <label class="product__description--label">Mô tả phòng:</label>
                                <p class="product_description">
                                    <?=  $room_detail['description']?>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
               
                
                <form action="" enctype="multipart/form-data" method="post">
                    <div class="user--ratting--value--box1">
             
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                      
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