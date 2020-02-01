<?php


namespace App\Service\Product;


use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;

class ProductRemover
{
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    public function destroy(Product $product)
    {
        $this->entityManager->remove($product);
        $this->entityManager->flush();
    }
}