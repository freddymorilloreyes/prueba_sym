<?php


namespace App\Service\Product;


use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;

class ProductUpdater
{
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    public function update(Product $product)
    {
        $this->entityManager->persist($product);
        $this->entityManager->flush();
    }
}