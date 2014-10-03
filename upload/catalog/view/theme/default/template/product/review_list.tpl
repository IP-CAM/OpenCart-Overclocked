<?php echo $header; ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
<?php echo $content_top; ?>
  <div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($reviews) { ?>
    <div class="product-filter">
      <div class="display"><img src="catalog/view/theme/<?php echo $template; ?>/image/page-list-active.png" alt="" /> <a onclick="display('grid');"><img src="catalog/view/theme/<?php echo $template; ?>/image/page-grid-off.png" alt="" /></a></div>
      <div class="limit"><?php echo $text_limit; ?>
        <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
          <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
          <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
          <?php } ?>
        <?php } ?>
        </select>
      </div>
      <div class="sort"><?php echo $text_sort; ?>
        <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
          <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
          <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
          <?php } ?>
        <?php } ?>
        </select>
      </div>
    </div>
    <div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
    <div class="review-list">	
      <?php foreach ($reviews as $review) { ?>
        <div>
		  <?php if (!$label && $review['offer']) { ?>
            <div class="promo-medium"><img src="catalog/view/theme/<?php echo $template; ?>/image/labels/offer-45x45.png" alt="" /></div>
          <?php } ?>
		  <?php if ($review['thumb']) { ?>
            <div class="image"><a href="<?php echo $review['href']; ?>"><img src="<?php echo $review['thumb']; ?>" alt="<?php echo $review['name']; ?>" /></a></div>
          <?php } ?>
          <div class="name"><a href="<?php echo $review['href']; ?>"><?php echo $review['name']; ?></a></div>
          <div class="text">&#8220;<?php echo $review['text']; ?>&#8221;</div>
          <div class="author"><?php echo $review['author']; ?></div>
          <div class="date"><?php echo $review['date_added']; ?></div>
		  <div class="rating">
            <img src="catalog/view/theme/<?php echo $template; ?>/image/stars-<?php echo $review['rating']; ?>.png" alt="<?php echo $review['reviews']; ?>" />
          </div>
		  <div class="links">
            <a onclick="addToWishList('<?php echo $review['product_id']; ?>');" class="button-add"><img src="catalog/view/theme/<?php echo $template; ?>/image/add-wishlist.png" alt="<?php echo $button_wishlist; ?>" title="<?php echo $button_wishlist; ?>" /></a>
            <a onclick="addToCompare('<?php echo $review['product_id']; ?>');" class="button-add"><img src="catalog/view/theme/<?php echo $template; ?>/image/add-compare.png" alt="<?php echo $button_compare; ?>" title="<?php echo $button_compare; ?>" /></a>
            <a href="<?php echo $review['href']; ?>" class="button-add"><img src="catalog/view/theme/<?php echo $template; ?>/image/add-view.png" alt="<?php echo $review['name']; ?>" title="<?php echo $review['name']; ?>" /></a>
          </div>
          <div class="cart">
            <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $review['product_id']; ?>');" class="button" />
          </div>
        </div>
      <?php } ?>
    </div>
    <div class="pagination"><?php echo $pagination; ?></div>
    <div class="buttons">
      <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
  <?php } else { ?>
    <?php echo $text_empty; ?>
    <div class="buttons">
      <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
  <?php } ?>
  <?php echo $content_bottom; ?>
</div>

<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.review-grid').attr('class', 'review-list');

		$('.review-list > div').each(function(index, element) {
			html  = '<div class="right">';

			var rating = $(element).find('.rating').html();

			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}

			html += '  <div class="links">' + $(element).find('.links').html() + '</div>';
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '</div>';

			html += '<div class="left">';

			var offer = $(element).find('.promo-medium').html();

			if (offer != null) {
				html += '<div class="promo-medium">' + $(element).find('.promo-medium').html() + '</div>';
			}

			var image = $(element).find('.image').html();

			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}

			html += '<div class="name">' + $(element).find('.name').html() + '</div>';

			var text = $(element).find('.text').html();

			html += '<div class="text">' + text + '</div>';

			var author = $(element).find('.author').html();

			if (author != null) {
				html += '<div class="author">' + author + '</div>';
			}

			var date = $(element).find('.date').html();

			if (date != null) {
				html += '<div class="date">' + date + '</div>';
			}

			html += '</div>';

			$(element).html(html);
		});

		$('.display').html('<img src="catalog/view/theme/<?php echo $template; ?>/image/page-list-active.png" alt="" /> <a onclick="display(\'grid\');"><img src="catalog/view/theme/<?php echo $template; ?>/image/page-grid-off.png" alt="" /></a>');

		$.totalStorage('display', 'list');

	} else {

		$('.review-list').attr('class', 'review-grid');

		$('.review-grid > div').each(function(index, element) {
			html = '';

			var offer = $(element).find('.promo-medium').html();

			if (offer != null) {
				html += '<div class="promo-medium">' + $(element).find('.promo-medium').html() + '</div>';
			}

			var image = $(element).find('.image').html();

			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}

			html += '<div class="name">' + $(element).find('.name').html() + '</div>';

			var text = $(element).find('.text').html();

			html += '<div class="text">' + text + '</div>';

			var author = $(element).find('.author').html();

			if (author != null) {
				html += '<div class="author">' + author  + '</div>';
			}

			var date = $(element).find('.date').html();

			if (date != null) {
				html += '<div class="date">' + date + '</div>';
			}

			var rating = $(element).find('.rating').html();

			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}

			html += '<div class="links">' + $(element).find('.links').html() + '</div>';
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';

			$(element).html(html);
		});

		$('.display').html('<a onclick="display(\'list\');"><img src="catalog/view/theme/<?php echo $template; ?>/image/page-list-off.png" alt="" /></a> <img src="catalog/view/theme/<?php echo $template; ?>/image/page-grid-active.png" alt="" /></a>');

		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('list');
}
//--></script> 

<?php echo $footer; ?>