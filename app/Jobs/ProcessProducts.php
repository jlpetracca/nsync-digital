<?php

namespace App\Jobs;

use App\Services\TiendaNubeService;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class ProcessProducts implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
	
	protected $tiendaNube;
	
	
    public function __construct(TiendaNubeService $tiendaNubeService)
    {
        $this->tiendaNube = $tiendaNubeService;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
    	$this->tiendaNube->syncProducts();
    }
}
