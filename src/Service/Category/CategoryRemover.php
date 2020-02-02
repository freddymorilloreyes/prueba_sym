<?php


namespace App\Service\Category;


use App\Entity\Category;
use App\Service\Category\Exception\CategoryDeleteException;
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
        if (count($category->getProducts())) {
            throw new CategoryDeleteException('No es posible eliminar esta Categoría pues Tiene Productos relacionados!');
        }
        $this->entityManager->remove($category);
        $this->entityManager->flush();
    }
}