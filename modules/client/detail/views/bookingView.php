<?php get_header('','Trang chủ');

?>
<main class="content-detail">
    
            <div class="content1">
               <form action="" method="POST" enctype="multipart/form-data">

               
                <div class="content__product--detail row row-12">
                    <div class="product__detail--img--box col-6">
                        <img src="public/uploads/<?= $room_detail['thumb']?>"
                            alt="" class="product__detail--img">
                            <div class="product__description--box">
                                <label class="product__description--label">Mô tả phòng:</label>
                                <p class="product_description">
                                    <?=  $room_detail['description']?>
                                </p>
                            </div>
                    </div>
                    

                    <div class="product__detail--info--box col-6">
                        <p class="product__name">
                            <?=  $room_detail['title']?>
                        </p>
                        <div class="product__quantity--box">
                            <label class="product__quantity--label">Giá phòng:</label>
                            <p class="product__quantity">
                                <input type="text" readonly value="<?= $room_detail['price']?>$" class="type1" name="price"> 
                              
                            </p>
                        </div>
                        <div class="product__quantity--box">
                            <label class="product__quantity--label">Loại phòng:</label>
                            <p class="product__quantity">
                            <select  id="" class="type1" name="loaiPhong">
                                <?php foreach($list_loai_phong as $key => $value):?>
                              
                                <option value="<?= $value['name']?>"><?= $value['name']?></option>
                      
                           
                               <?php endforeach;?>
                               </select>
                            </p>
                        </div>
                        <div class="product__quantity--box">
                            <label class="product__quantity--label">Số lượng phòng còn:</label>
                            <p class="product__quantity">
                                <input type="text" readonly value="<?= $room_detail['count']?>" class="type1" name="slPhong">
                              
                            </p>
                        </div>
                      
                       

                 
                   
                                <div class="product__quantity--box">
                                    <label class="product__quantity--label"> Ngày đặt </label>
                                    <p class="product__quantity">
                                    <input type="date"  max="" class="type1" name="ngayDat">
                              
                            </p>
                                
                                </div>
                                <div class="product__quantity--box">
                                    <label class="product__quantity--label"> Ngày trả </label>
                                       
                                        <p class="product__quantity">
                                    <input type="date"  max="" class="type1" name="ngayTra" >
                              
                            </p>
                              
                                </div>
                                <?php if(isset($_SESSION['auth']['role']) && $_SESSION['auth']['role']== 1){ ?>
                                <div class="product__buy--function">
                                 
                                   <button class="product__buy--function--buy--now">Đặt Phòng
                                        Ngay</button>
                                 
                                   
                                   
                               
                                </div>
                                <?php }else{?>
                                  
                                    <?php }?>
                        
                          
                      
                    </div>
                </div>
               
                </form>
             

            </div>



    </div>
    </main>

<?php get_footer()?>