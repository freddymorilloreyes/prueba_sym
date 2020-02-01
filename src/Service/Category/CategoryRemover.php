<?php


namespace App\Service\Category;


use App\Entity\Category;
use Doctrine\ORM\EntityManagerInterface;

class CategoryRemover
{
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    public function destroy(Category $category)
    {
        $this->entityManager->remove($category);
        $this->entityManager->flush();
    }
}