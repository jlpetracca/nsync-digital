<?php
namespace App\Services;

class MagentoService extends Service
{
    protected $credentials = [];

    /**
     * MagentoService constructor.
     * @param array $credentials
     */
    public function __construct(array $credentials)
    {
        $this->credentials = $credentials;
    }

    /**
     * @return string
     */
    public function getToken(): string
    {
        $params = [
            'username' => $this->credentials['username'],
            'password' => $this->credentials['password']
        ];

        $data = json_encode($params);
        $options = [
            CURLOPT_URL => $this->credentials['url'],
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => $data,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => ["Content-Type: application/json","Content-Length: ". strlen($data)]
        ];
        $accessToken = $this->curl($options);
        return $accessToken;
    }

    /**
     * @param array $productsStructured
     * @param string $token
     * @return void
     */
    public function uploadProducts(array $productsStructured, string $token): void
    {
        $options = [
            CURLOPT_URL => $this->credentials['url'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => json_encode($this->getProductsStructured($productsStructured)),
            CURLOPT_HTTPHEADER => [
                "accept: application/json",
                "content-type: application/json",
                "authorization: Bearer " . $token,
            ]
        ];
        $this->curl($options);
    }

    /**
     * @param string $token
     */
    public function syncProducts(string $token): void
    {
        // TODO: Implement syncProducts() method.
    }

    /**
     * @param array $products
     * @return array
     */
    private function getProductsStructured(array $products): array
    {
        $structure = [];
        foreach ($products as $parserProduct => $product){
            $structure[] = [
                "product" => [
                    "sku"=> "aaaaaaaa",
                    "name"=> "bbbbbbbbbbb",
                    "attribute_set_id"=> 4,
                    "price"=> "1",
                    "status"=> 1,
                    "visibility"=> 4,
                    "type_id"=> "downloadable",
                    "extension_attributes"=> [
                        "stock_item"=> [
                            "manage_stock"=> 1,
                            "is_in_stock"=> 1,
                            "qty"=> "10"
                        ],
                        "downloadable_product_samples"=> [[
                            "title"=> "sample1185869143",
                            "sort_order"=> "0",
                            "sample_type"=> "url",
                            "sample_url"=> "http://example.com"
                        ]],
                        "downloadable_product_links"=> [[
                            "title"=> "link-1-185862143",
                            "sort_order"=> "1",
                            "is_shareable"=> 0,
                            "price"=> 2.43,
                            "number_of_downloads"=> "2",
                            "link_type"=> "url",
                            "link_url"=> "http://example.com",
                            "sample_type"=> "url",
                            "sample_url"=> "http://example.com"
                        ]]
                    ],
                    "custom_attributes"=> [[
                        "attribute_code"=> "tax_class_id",
                        "value"=> 2
                    ], [
                        "attribute_code"=> "quantity_and_stock_status",
                        "value"=> [
                            "qty"=> "10",
                            "is_in_stock"=> 1
                        ]
                    ], [
                        "attribute_code"=> "is_virtual",
                        "value"=> 1
                    ], [
                        "attribute_code"=> "url_key",
                        "value"=> "1111111111"
                    ], [
                        "attribute_code"=> "links_title",
                        "value"=> "Links title 185862143"
                    ], [
                        "attribute_code"=> "links_purchased_separately",
                        "value"=> 1
                    ], [
                        "attribute_code"=> "samples_title",
                        "value"=> "Samples185692143"
                    ], [
                        "attribute_code"=> "links_exist",
                        "value"=> 1
                    ]]
                ],
            ];
        }
        return $structure;
    }

}