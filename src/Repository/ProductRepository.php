<?php

namespace App\Repository;

use App\Entity\Category;
use App\Entity\Product;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Product|null find($id, $lockMode = null, $lockVersion = null)
 * @method Product|null findOneBy(array $criteria, array $orderBy = null)
 * @method Product[]    findAll()
 * @method Product[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProductRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Product::class);
    }

    /**
     * @param $data
     * @return Product[] Returns an array of Product objects
     */
    public function findByFilters($data)
    {
        $q = $this->createQueryBuilder('p')
            ->innerJoin(Category::class,'c')
            ->where('p.category = c.id')
            ->andWhere('c.active = 1')
            ->orderBy('p.createdAt', 'ASC');
            if (isset($data['name']) && $data['name'] != null) {
                $q->andWhere('p.name like :name')
                ->setParameter('name', '%'.$data['name'].'%');
            }
            if (isset($data['code']) && $data['code'] != null) {
                $q->andWhere('p.code like :code')
                ->setParameter('code', '%'.$data['code'].'%');
            }
            if (isset($data['category']) && $data['category'] != null) {
                $q->andWhere('p.category = :category')
                ->setParameter('category', $data['category']);
            }
        ;
        return $q
            ->getQuery()
            ->getResult();
    }

    /*
    public function findOneBySomeField($value): ?Product
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
