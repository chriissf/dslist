package com.devsupeior.dslist.repositories;

import com.devsupeior.dslist.entities.Game;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.support.Repositories;

public interface GameRepository extends JpaRepository<Game,Long> {


}
