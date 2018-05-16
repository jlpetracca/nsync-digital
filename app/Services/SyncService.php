<?php
namespace App\Services;

use App\Product;

class SyncService {

    /* @var \Illuminate\Database\Eloquent\Model */
    private $model;
    private $inserts;
    private $products;

    /**
     * SyncService constructor.
     * @param array $products
     */
    public function __construct(array $products){
        $this->inserts    = [];
        $this->model      = new Product();
        $this->products   = $products;
    }

    public function sync(){
        if(!empty($this->products)){
            foreach ($this->products as $product)
            {
                $this->updateOrInsert($product);
            }
        }

        if(!empty($this->inserts))
        {
            foreach ($this->inserts as $insert)
            {
                $this->model->create($insert);
            }
        }
    }

    /**
     * @param array $product
     */
    private function updateOrInsert(array $product)
    {
        $search = $this->model->where('product_id', $product['product_id'])->first();

        if(!empty($search))
        {
            $search->update($product);
        }
        else {
            $this->inserts[] = $product;
        }

    }

    /**
     * @param $id
     * @throws \Exception
     */
    public function delete($id)
    {
        $this->model->where('id', $id)->delete();
    }
}