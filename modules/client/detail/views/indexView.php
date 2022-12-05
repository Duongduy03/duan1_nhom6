<?php get_header('', 'Trang chủ');

?>
<main class="content-detail">

    <div class="content1">

        <div class="content__product--detail row row-12">
            <div class="product__detail--img--box col-6" style="">
                <img src="public/uploads/<?= $room_detail['thumb'] ?>" alt="" class="product__detail--img">
            </div>

            <div class="product__detail--info--box col-6">
                <p class="product__name">
                    <?= $room_detail['title'] ?>
                </p>
                <p class="product__price">
                    <?= $room_detail['price'] ?><span>$</span>
                </p>
                <div class="product__quantity--box">
                    <label class="product__quantity--label">Số lượng:</label>
                    <p class="product__quantity">
                        <?= $room_detail['count'] ?>
                    </p>
                </div>

                <div class="product__buy--form">

                    <div class="product__buy--value--box">
                        <label class="product__buy--value--title"> Ngày đặt </label>
                        <input type="date" min="1" max="" class="product__date">
                    </div>
                    <?php if (isset($_SESSION['auth']['role']) && $_SESSION['auth']['role'] == 1) { ?>
                        <div class="product__buy--function">
                            <a href="?role=client&mod=detail&action=booking&id_room=<?= $room_detail['id'] ?>">
                                <button class="product__buy--function--buy--now">Đặt Phòng
                                    Ngay</button>
                            </a>



                        </div>
                    <?php } else { ?>

                    <?php } ?>

                    <div class="product__description--box">
                        <label class="product__description--label">Mô tả phòng:</label>
                        <p class="product_description">
                            <?= $room_detail['description'] ?>
                        </p>
                    </div>
                </div>
            </div>
        </div>




        <div class="product__detail--ratted">

            <?php foreach ($comment as $keyBinhLuanSanPham => $valueBinhLuanSanPham) : ?>
                <div class="product__detail--ratted--block">


                    <div class="user__ratted--info">
                        <div class="user--ratted--info--link">
                            <div class="user--ratted--img--box" style="">

                                <img src="public/uploads/<?= $valueBinhLuanSanPham['thumb'] ?>" alt="" class="user--ratted--img" style="width: 50px;
    height: 50px;
    border-radius: 50px;">
                            </div>
                            <div class="db2">
                                <div class="db">
                                    <p class="user--ratted--name"><?= $valueBinhLuanSanPham['full_name'] ?></p>
                                    <p class="user--ratted--name"><?= $valueBinhLuanSanPham['create_at'] ?></p>
                                </div>
                                <div class="user--ratted--star">
                                    <?php
                                    for ($i = 0; $i < $valueBinhLuanSanPham['so_sao']; $i++) {
                                        echo "<i class='fa-solid fa-star' style = 'color : yellow; '></i>";
                                    }
                                    ?>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="user--ratted">

                        <div class="user--ratted--comment--box">
                            <p class="user--ratted--comment"><?= $valueBinhLuanSanPham['description'] ?></p>
                        </div>
                    </div>
                </div>
            <?php endforeach ?>
        </div>
        <?php if (isset($_SESSION['auth'])) { ?>
            <form action="" enctype="multipart/form-data" method="post">
                <div class="user--ratting--value--box1">
                    <div>Đánh giá :</div>
                    <div id="rating">
                        <input type="radio" id="star5" name="rating" value="5" />
                        <label class="full" for="star5" title="Awesome - 5 stars"></label>

                        <input type="radio" id="star4" name="rating" value="4" />
                        <label class="full" for="star4" title="Pretty good - 4 stars"></label>


                        <input type="radio" id="star3" name="rating" value="3" />
                        <label class="full" for="star3" title="Meh - 3 stars"></label>


                        <input type="radio" id="star2" name="rating" value="2" />
                        <label class="full" for="star2" title="Kinda bad - 2 stars"></label>


                        <input type="radio" id="star1" name="rating" value="1" />
                        <label class="full" for="star1" title="Sucks big time - 1 star"></label>

                        
                    </div>

                </div>
                <div class="user--ratting--value--box">
                    <label>Bình luận :</label>
                    <textarea name="comment" id="" cols="30" rows="10" class="user--ratting--comment" placeholder="Đánh giá của bạn về sản phẩm..."></textarea>
                    <!-- s -->
                </div>
                <input type="hidden" name="id_user" value="<?= $_SESSION['auth']['id'] ?>" />
                <input type="hidden" name="id_phong" value="<?= $room_detail['id'] ?>" />
                <a href="?role=client&mod=detail&action=comment&id_room =<?= $room_detail['id'] ?>">
                    <button type="submit" class="submit-comment" name="submit-comment">Gửi</button>
                </a>
            </form>
        <?php } else { ?>
            <a href="?role=client&mod=auth">Bạn Phải đăng nhập/đăng ký để Bình Luận về phòng bên Khách sạn House Hotel</a>
        <?php } ?>
    </div>


    </div>




    </div>
    <script>
        function calcRate(r) {
        const f = ~~r,//Tương tự Math.floor(r)
        id = 'star' + f + (r % f ? 'half' : '')
        id && (document.getElementById(id).checked = !0)
        }
    </script>
</main>

<?php get_footer() ?>