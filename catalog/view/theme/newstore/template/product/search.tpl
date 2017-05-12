<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb <?php if (($menu_open_search =='1') && ($main_menu =='1') && ($column_left)) { ?>col-md-offset-3 col-lg-offset-3<?php } ?>">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
		<?php if($i+1<count($breadcrumbs)) { ?> <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li> <?php } else { ?><li><?php echo $breadcrumb['text']; ?></li><?php } ?>
	<?php } ?>
  </ul>
  <div class="row">
   <?php if(($menu_open_search =='1') && ($main_menu =='1') && ($column_left)) { ?>
		<script type="text/javascript">
		if(window.matchMedia("(min-width: 992px)").matches){
			$('header #menu-list').addClass("nsmenu-block");
			$(function(){$('#column-left').css({'margin-top': $('header #menu-list').outerHeight() - 54});});
		}
		$(window).resize(function() {
			if ($(window).width() > 992) {
				$('header #menu-list').addClass("nsmenu-block");
				$(function(){$('#column-left').css({'margin-top': $('header #menu-list').outerHeight() - 54});});
			} else {
				$('header #menu-list').removeClass("nsmenu-block");
			}
		});
		</script>
	<?php } ?>
  <?php echo $column_left; ?>
   <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-4 col-md-6'; ?>
    <?php $cols_class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-9'; ?>
	<?php $cols_class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
	<?php $cols_class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
  <?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
      <div class="row">
        <div class="col-sm-4">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-3">
          <label class="checkbox-inline">
            <?php if ($sub_category) { ?>
            <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?></label>
        </div>
      </div>
      <p>
        <label class="checkbox-inline">
          <?php if ($description) { ?>
          <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          <?php } else { ?>
          <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          <?php echo $entry_description; ?></label>
      </p>
      <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
      <h2><?php echo $text_search; ?></h2>
      <?php if ($products) { ?>
		 <div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 text-xs-center text-sm-center text-md-center text-lg-left  localstorage" style="margin:10px 0px;">
			<div class="btn-group">
				 <div class="btn-group">
					 <button type="button" class="btn btn-sort-limit dropdown-toggle" data-toggle="dropdown">
						<?php echo str_replace(":","",$text_sort); ?>
						<span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu text-left">
						<?php foreach ($sorts as $sorts) { ?>
						<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
						<li class="active"><a href="<?php echo $sorts['href']; ?>" rel="nofollow"><?php echo $sorts['text']; ?></a></li>
						<?php } else { ?>
						<li><a href="<?php echo $sorts['href']; ?>" rel="nofollow"><?php echo $sorts['text']; ?></a></li>
						<?php } ?>
						<?php } ?>
					  </ul>
				</div>
				<div class="btn-group hidden-xs localstorage">
					<button type="button" id="list-view" class="btn" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
					<button type="button" id="grid-view" class="btn" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
					<?php if($config_price_list_view_on_off_search_page) { ?>
						<button type="button" id="price-view" class="btn" data-toggle="tooltip" title="<?php echo $button_price; ?>"><i class="fa fa-align-justify"></i></button>
					<?php } ?>
				</div>
				<div class="btn-group">
                  <ul class="dropdown-menu text-left">
                    <?php foreach ($limits as $limits) { ?>
                    <?php if ($limits['value'] == $limit) { ?>
                    <li class="active"><a href="<?php echo $limits['href']; ?>" rel="nofollow"><?php echo $limits['text']; ?></a></li>
                    <?php $mmr_limit_active = $limits['text']; ?>
                    <?php } else { ?>
                    <li><a href="<?php echo $limits['href']; ?>" rel="nofollow"><?php echo $limits['text']; ?></a></li>
                    <?php } ?>
                    <?php } ?>
                  </ul>
                  <button type="button" class="btn btn-sort-limit dropdown-toggle" data-toggle="dropdown" title="<?php echo $text_limit;?>">
                    <i class="fa fa-arrows-v hidden-md hidden-lg"></i> <span class="hidden-xs hidden-sm"><?php echo $text_limit; ?> </span><?php echo isset($mmr_limit_active) ? $mmr_limit_active : $limits['text']; ?>
                    <span class="caret"></span>
                  </button>
                </div>
			</div>
		</div>
		 </div> 
     <div class="row row-price">
        <?php foreach ($products as $product) { ?>
         <div class="product-layout product-grid <?php echo $cols_class;?>">
          <div class="product-thumb">
		  <?php if($config_on_off_search_page_quickview =='1'){?>
						<div class="quickview"><a class="btn btn-quickview" onclick="quickview_open(<?php echo $product['product_id']?>);"><i class="fa fa-external-link fa-fw"></i><?php echo $config_quickview_btn_name[$lang_id]['config_quickview_btn_name']; ?></a></div>
					<?php } ?>
            <div class="image">	
							<div class="stickers-ns">
								<?php if ($product['special']) { ?>
									<div class="sticker-ns procent-skidka"><i class="fa fa-tag"></i> <?php echo round ($product['skidka']);?> %</div>
								<?php } ?>
								<?php if (($on_off_sticker_special == '1') && $product['special']) { ?>
									<div class="sticker-ns special">
										<i class="fa <?php echo $config_change_icon_sticker_special;?> fa-fw"></i>					
										<span><?php echo $text_sticker_special[$lang_id]['config_change_text_sticker_special']; ?></span>	
									</div>
								<?php } ?>
								<?php if(($on_off_sticker_topbestseller == '1') && ($product['top_bestsellers'] >= $config_limit_order_product_topbestseller)) { ?>
									<div class="sticker-ns bestseller">
										<i class="fa <?php echo $config_change_icon_sticker_topbestseller;?> fa-fw"></i>
										<span><?php echo $text_sticker_topbestseller[$lang_id]['config_change_text_sticker_topbestseller']; ?></span>	
									</div>
								<?php } ?>
								<?php if(($on_off_sticker_popular == '1') && ($product['viewed']>=$config_min_quantity_popular)) { ?>
									<div class="sticker-ns popular">
										<i class="fa <?php echo $config_change_icon_sticker_popular;?> fa-fw"></i>
										<span><?php echo $text_sticker_popular[$lang_id]['config_change_text_sticker_popular']; ?></span>								
									</div>
								<?php } ?>
								<?php if(($on_off_sticker_newproduct == '1') && (isset($product['date_available'])&&(round((strtotime(date("Y-m-d"))-strtotime($product['date_available']))/86400))<=$config_limit_day_newproduct)) { ?>
									<div class="sticker-ns newproduct">
										<i class="fa <?php echo $config_change_icon_sticker_newproduct;?>"></i>
										<?php echo $text_sticker_newproduct[$lang_id]['config_change_text_sticker_newproduct']; ?>	
									</div>
								<?php } ?>
							</div>
				<?php if($ns_on_off_search_page_slider_additional_image =='1') { ?>
				<div class="image-carousel-category" >			
					<a itemprop="url" href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> itemprop="image" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>		
				<?php foreach ($product['additional_img'] as $img) { ?>			
					<a class="hidden additional-image" href="<?php echo $product['href']; ?>"><img class="img-responsive" src="<?php echo $img;?>" alt="" title="" /></a>			
				<?php } ?>
				</div>	
				<?php } elseif($ns_on_off_search_page_slider_additional_image =='2') { ?>
					<a itemprop="url" href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> itemprop="image" <?php if($product['additional_image_hover']) { ?>data-additional-hover="<?php echo $product['additional_image_hover'];?>"<?php } ?> src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>	
				<?php } else { ?>
					<a itemprop="url" href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> itemprop="image"src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
				<?php } ?>
				<?php if($show_special_timer_page =='1' && $product['special']){ ?>
					<div class="action-timer">
						<div id="countdown-category-<?php echo $product['product_id'];?>"></div>		
					</div>
					<script type="text/javascript">
						$(function(){
							var note = $('#note'),
							ts = new Date('<?php echo $product['str_timer_1'];?>', '<?php echo $product['str_timer_2'];?>', '<?php echo $product['str_timer_3']?>'),
							newYear = true;
							if((new Date()) > ts){
								ts = (new Date()).getTime() + 10*24*60*60*1000;
								newYear = false;
							}
							$('#countdown-category-<?php echo $product['product_id'];?>').countdown({
								timestamp: ts,
								callback: function(days, hours, minutes, seconds){						
									var message = "";		
									message += days;
									message += hours;
									message += minutes;
									message += seconds;											
									note.html(message);
									}
							});
						});
					</script>
				<?php } ?>		
			</div>
            <div class="caption">
			<div class="actions-quick-order grid-quick-order">
				<div class="quick-order">
				<?php if($ns_on_off_module_quick_order =='1') { ?>
				<?php if($ns_on_off_search_page_fastorder !='0') { ?>
			<button class="btn btn-fastorder <?php if (($product['product_quantity'] <= 0) and $disable_fastorder_button){ ?>hidden-quick-order<?php } ?>" type="button" data-toggle="tooltip" onclick="fastorder_open(<?php echo $product['product_id']?>);" title="<?php echo $config_text_open_form_send_order[$lang_id]['config_text_open_form_send_order']; ?>" >
				<?php if($icon_open_form_send_order !=''){ ?>
					<i style="color:#<?php echo $color_button_open_form_send_order ;?>;" class="<?php echo $icon_open_form_send_order;?> fa-fw"></i>
				<?php } else { ?>
					<i style="color:#<?php echo $color_button_open_form_send_order ;?>;" class="fa fa-shopping-bag fa-fw"></i>
				<?php } ?>
				<?php echo $config_text_open_form_send_order[$lang_id]['config_text_open_form_send_order']; ?>
			</button>
			<?php } ?>
			<?php } ?>
		  </div>
		  </div>
                <div class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
				<?php if($ns_on_off_search_page_model_product !='0') { ?>
						<div class="product-model"><?php echo $product['model']?></div>
				<?php } ?>
				<?php if($ns_on_off_search_page_description !='0') { ?>
						<div class="product-description"><?php echo $product['description']; ?></div>
				<?php } ?>
				 <?php if ($show_options) { ?>
							<div id="option_productpage_<?php echo $product['product_id']; ?>" class="option productpage-opt">
								<?php foreach ($product['options'] as $key => $option) { ?>	
									<?php if ($option['type'] == 'select' || $option['type'] == 'radio') { ?>
									<div class="form-group">
										<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
											<?php if ($option['required']) { ?><i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i><?php } ?>
											<?php echo $option['name']; ?>
										</label>
									  <div id="input-option-productpage<?php echo $option['product_option_id']; ?>">
										<?php foreach ($option['product_option_value'] as $option_value) { ?>
										<div class="radio-checbox-options">
											<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
											<label for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage">
												<span class="option-name"><?php echo $option_value['name']; ?></span>
												<?php if ($option_value['price']) { ?>
												<span class="option-price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
												<?php } ?>
											</label>
										</div>
										<?php } ?>
									  </div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'checkbox') { ?>
									<div class="form-group">
									  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
											<?php if ($option['required']) { ?><i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i><?php } ?>
											<?php echo $option['name']; ?>
										</label>
									  <div id="input-option-productpage<?php echo $option['product_option_id']; ?>">
										<?php foreach ($option['product_option_value'] as $option_value) { ?>
										<div class="radio-checbox-options">
										  <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
											<label for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage">
											<span class="option-name"><?php echo $option_value['name']; ?></span>
												<?php if ($option_value['price']) { ?>
												<span class="option-price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
												<?php } ?>
										  </label>
										</div>
										<?php } ?>
									  </div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'image') { ?>
										<?php if ($option['status_color_type'] =='1') { ?>
											<div class="form-group">
											 <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
														<?php if ($option['required']) { ?>
															<i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i>
														<?php } ?>
													<?php echo $option['name']; ?>
												</label>
											  <div id="input-option-productpage<?php echo $option['product_option_id']; ?>">
												<?php foreach ($option['product_option_value'] as $option_value) { ?>
												<div class="image-radio">
												  <label>
													<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
													<span for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span>
												  </label>
												</div>
												<?php } ?>
											  </div>
											</div>
										<?php } else { ?>
											<div class="form-group">
											 <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
														<?php if ($option['required']) { ?>
															<i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i>
														<?php } ?>
													<?php echo $option['name']; ?>
												</label>
											  <div id="input-option-productpage<?php echo $option['product_option_id']; ?>">
												<?php foreach ($option['product_option_value'] as $option_value) { ?>
												<div class="image-radio">
												  <label>
													<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
													<img for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 
												  </label>
												</div>
												<?php } ?>
											  </div>
											</div>
										<?php } ?>
									<?php } ?>
								<?php } ?>
									</div>
								<?php } ?>	
				 <?php if ($ns_on_off_search_page_rating !='0') { ?>
				 <div class="rating">
				 <span class="rating-box">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
				  <?php if ($ns_on_off_search_page_quantity_reviews !='0') { ?>
				  <span class="quantity-reviews"><a data-placement="right"  data-toggle="tooltip" title="<?php echo $text_reviews_title;?>" href="<?php echo $product['href']; ?>/#tab-review"><?php echo $product['reviews']; ?></a></span>
					<?php } ?>
				</div>
				</span>
				 <?php } ?>
				   <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
				<div class="price-view-price">
				<?php if (!$product['special']) { ?>
					<span class="change-price<?php echo $product['product_id']; ?>" data-price="<?php echo $product['price_no_format']; ?>"><?php echo $product['price']; ?></span>
				<?php } else { ?>
					<span class="price-old change-price<?php echo $product['product_id']; ?>" data-price="<?php echo $product['price_no_format']; ?>">&nbsp;<?php echo $product['price']; ?>&nbsp;</span> <span class="price-new change-special<?php echo $product['product_id']; ?>" data-price="<?php echo $product['special_no_format']; ?>"><?php echo $product['special']; ?></span>
				<?php } ?>
				<?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
				</div>
				<div class="quantity_cart-view-price">
					<div class="quick-cell-content pquantity">
						<div class="input-group popup-quantity">
							<span class="input-group-btn">
								<button onclick="btnminus_cat_price<?php echo $product['product_id'];?>('<?php echo $product['minimum']; ?>');" type="button" class="btn btn-update-popup">-</button>
							</span>
								<input id="htopcat_list<?php echo $product['product_id'];?>" class="htopcat<?php echo $product['product_id'];?> form-control" name="<?php echo $product['product_id']; ?>" oninput="recalc(<?php echo $product['product_id']; ?>);" size="2" value="<?php echo $product['minimum']; ?>">
							<span class="input-group-btn">
								<button onclick="btnplus_cat_price<?php echo $product['product_id'];?>();" type="button" class="btn btn-update-popup">+</button>
							</span>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					function btnminus_cat_price<?php echo $product['product_id'];?>(a){
						document.getElementById("htopcat_list<?php echo $product['product_id'];?>").value>a?document.getElementById("htopcat_list<?php echo $product['product_id'];?>").value--:document.getElementById("htopcat_list<?php echo $product['product_id'];?>").value=a;										
						recalc(<?php echo $product['product_id'];?>);						
					}
					function btnplus_cat_price<?php echo $product['product_id'];?>(){
						document.getElementById("htopcat_list<?php echo $product['product_id'];?>").value++;
						recalc(<?php echo $product['product_id'];?>);							
					};																				
				</script>
				<div class="actions">
					<?php if($ns_on_off_search_page_wishlist !='0') { ?>
						<div class="wishlist"><button class="btn btn-wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button></div>
					<?php } ?>
					<?php if (($product['product_quantity'] <= 0) and $disable_cart_button){ ?>
						<div class="cart"><button class="btn btn-general" type="button" disabled><?php if($change_text_cart_button_out_of_stock ==1) { ?><i class="fa fa-minus-square out_of_stock"></i> <span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></div>
					<?php } else { ?>
						<div class="cart"><button class="btn btn-general" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>','productpage', $('.quantity_cart-view-price').find('input.htopcat<?php echo $product['product_id'];?>[name^=<?php echo $product['product_id']; ?>]').val());"><?php if($change_text_cart_button_out_of_stock ==1 && $product['product_quantity'] <= 0) { ?><i class="fa fa-minus-square out_of_stock"></i> <span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></div>
					<?php } ?>
						<?php if($ns_on_off_search_page_compare !='0') { ?>
					<div class="compare"><button class="btn btn-compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button></div>
					<?php } ?>
					<div class="list-quick-order">	
					<?php if($ns_on_off_module_quick_order =='1') { ?>
					<?php if($ns_on_off_search_page_fastorder !='0'){ ?>
					<button class="btn btn-fastorder <?php if (($product['product_quantity'] <= 0) and $disable_fastorder_button){ ?>hidden-quick-order<?php } ?>" type="button" data-toggle="tooltip" onclick="fastorder_open(<?php echo $product['product_id']?>);" title="<?php echo $config_text_open_form_send_order[$lang_id]['config_text_open_form_send_order']; ?>" >
						<?php if($icon_open_form_send_order !=''){ ?>
							<i style="color:#<?php echo $color_button_open_form_send_order ;?>;" class="<?php echo $icon_open_form_send_order;?> fa-fw"></i>
						<?php } else { ?>
							<i style="color:#<?php echo $color_button_open_form_send_order ;?>;" class="fa fa-shopping-bag fa-fw"></i>
						<?php } ?>
						<span class="hidden-xs"><?php echo $config_text_open_form_send_order[$lang_id]['config_text_open_form_send_order']; ?></span>
					</button>					
					<?php } ?>
					<?php } ?>
					</div>
				</div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
        <div class="col-sm-12 text-right"><?php echo $results; ?></div>
      </div>
	   <script type="text/javascript"><!--
	function price_format(n){ 	
		c = <?php echo (empty($currency['decimals']) ? "0" : $currency['decimals'] ); ?>;
		d = '<?php echo $currency['decimal_point']; ?>';
		t = '<?php echo $currency['thousand_point']; ?>';
		s_left = '<?php echo $currency['symbol_left']; ?>';
		s_right = '<?php echo $currency['symbol_right']; ?>';
		n = n * <?php echo $currency['value']; ?>;
		i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 
		j = ((j = i.length) > 3) ? j % 3 : 0; 
		return s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right; 
	}
	//--></script>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	var search = $('#content input[name=\'search\']').prop('value');
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}
	var category_id = $('#content select[name=\'category_id\']').prop('value');
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
	if (sub_category) {
		url += '&sub_category=true';
	}
	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
	if (filter_description) {
		url += '&description=true';
	}
	location = url;
});
$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});
$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});
$('select[name=\'category_id\']').trigger('change');
--></script> 
 <?php if ($config_on_off_search_page_slider_additional_image == '1') { ?>
<script type="text/javascript">
$(window).load(function() {
	$(".additional-image").removeClass('hidden');
		$(".image-carousel-category").owlCarousel({
			singleItem:true,			
			navigation : true, 
			pagination:false,
			navigationText: ['<div class="btn btn-carousel-image-additional next-prod"><i class="fa fa-angle-left arrow"></i></div>', '<div class="btn btn-carousel-image-additional prev-prod"><i class="fa fa-angle-right arrow"></i></div>'],		
			transitionStyle: '<?php echo $ns_select_search_page_additional_animate_method;?>'
		});
$('#list-view').click(function(e){
$(".additional-image").addClass('hidden');
    e.preventDefault();
	setTimeout(function () {
		$(".image-carousel-category").each(function() { 
		 var items = $(this);
			for (var i = 0; i < items.length; i++) {
				if($(items).data('owlCarousel')){
					$(items).data('owlCarousel').destroy();
				}
				$(".additional-image").removeClass('hidden');
					$(items).owlCarousel({
								navigation : true,
								singleItem:true,		
								pagination:false,
								navigationText: ['<div class="btn btn-carousel-image-additional list next-prod"><i class="fa fa-angle-left arrow"></i></div>', '<div class="btn btn-carousel-image-additional prev-prod"><i class="fa fa-angle-right arrow"></i></div>'],		
								transitionStyle: '<?php echo $ns_select_search_page_additional_animate_method;?>'
					});	
			} 
		});
	}, 200);
});	
$('#grid-view').click(function(e){
$(".additional-image").addClass('hidden');
    e.preventDefault();
	setTimeout(function () {
		$(".image-carousel-category").each(function() { 
		 var items = $(this);
			for (var i = 0; i < items.length; i++) {
				if($(items).data('owlCarousel')){
					$(items).data('owlCarousel').destroy();
				}
				$(".additional-image").removeClass('hidden');
					$(items).owlCarousel({
								navigation : true, 
								singleItem:true,
								pagination:false,
								navigationText: ['<div class="btn btn-carousel-image-additional list next-prod"><i class="fa fa-angle-left arrow"></i></div>', '<div class="btn btn-carousel-image-additional prev-prod"><i class="fa fa-angle-right arrow"></i></div>'],									
								transitionStyle: '<?php echo $ns_select_search_page_additional_animate_method;?>'
					});	
			} 
		}); 
	}, 200);
});
$('#price-view').click(function(e){	
$(".additional-image").addClass('hidden');
e.preventDefault(); 
	$(".image-carousel-category").each(function() { 
		var items = $(this);
		for (var i = 0; i < items.length; i++) {
			$(items).data('owlCarousel').destroy();
		} 
	}); 
});	  
});
</script>
<?php } ?>
<?php echo $footer; ?>