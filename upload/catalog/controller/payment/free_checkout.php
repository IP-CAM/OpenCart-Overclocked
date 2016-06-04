<?php
class ControllerPaymentFreeCheckout extends Controller {

	protected function index() {
		$this->language->load('payment/free_checkout');

		$this->data['text_wait'] = $this->language->get('text_wait');
		$this->data['text_loading'] = $this->language->get('text_loading');

		$this->data['button_confirm'] = $this->language->get('button_confirm');

		$this->data['continue'] = $this->url->link('checkout/success');

		// Theme
		$this->data['template'] = $this->config->get('config_template');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/free_checkout.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/free_checkout.tpl';
		} else {
			$this->template = 'default/template/payment/free_checkout.tpl';
		}

		$this->render();
	}

	public function confirm() {
		if ($this->session->data['payment_method']['code'] == 'free_checkout') {
			$this->load->model('checkout/order');

			$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('free_checkout_order_status_id'));
		}
	}
}
?>