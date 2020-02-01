<?php


namespace App\Service\Category;


use App\Entity\Category;
use Doctrine\ORM\EntityManagerInterface;

class CategoryUpdater
{
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    public function update(Category $category)
    {
        $this->entityManager->persist($category);
        $this->entityManager->flush();
    }
}