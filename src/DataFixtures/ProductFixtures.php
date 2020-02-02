<?php

namespace App\DataFixtures;

use App\Entity\Category;
use App\Entity\Product;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class ProductFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        // $product = new Product();

        // $manager->persist($product);
        // create 20 products! Bam!
        for ($i = 0; $i < 100; $i++) {
            $category = $manager->getRepository(Category::class)->find(mt_rand(1, 5));
            $product = new Product();
            $product->setCode('productCode '.$i);
            $product->setName('product '.$i);
            $product->setDescription(' Des product '.$i);
            $product->setBrand('brand'.mt_rand(1, 5));
            $product->setPrice(mt_rand(100000, 1000000));
            $product->setCategory($category); //aun no se como pasarle la categoria
            $manager->persist($product);
            $manager->flush();
        }
    }
}
