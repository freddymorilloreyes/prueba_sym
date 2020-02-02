<?php

namespace App\DataFixtures;

use App\Entity\Category;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class CategoryFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        for ($i = 0; $i < 10; $i++) {
            $category = new Category();
            $category->setCode('catcode'.$i);
            $category->setName('Cat '.$i);
            $category->setActive(true);
            $category->setDescription('des cat '.$i);
            $this->addReference('category_'.$i,$category);
            $manager->persist($category);
        }
        $manager->flush();
    }
}
