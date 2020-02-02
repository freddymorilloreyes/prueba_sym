<?php

namespace App\DataFixtures;

use App\Entity\Product;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class ProductFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        for ($i = 0; $i < 100; $i++) {
            $product = new Product();
            $product->setCode('prodCode'.$i);
            $product->setName('product '.$i);
            $product->setDescription(' Des product '.$i);
            $product->setBrand('brand'.mt_rand(1, 5));
            $product->setPrice(mt_rand(100000, 1000000));
            $product->setCategory($this->getReference('category_'.mt_rand(2,8)));
            $manager->persist($product);
        }
        $manager->flush();
    }
}
